## FLUTTER VERSION ##
FROM alpine AS version

RUN apk add --no-cache jq

# Query the most recent Flutter stable version
# New Beta releases will invalidate cache, so we do it in its own layer to avoid invalidating the build layers
ADD https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json releases.json
RUN jq -r '.current_release.stable as $sha | first(.releases[] | select(.hash == $sha and .channel == "stable")) | "\(.version) \($sha)"' releases.json > /flutter-stable && \
    test -s /flutter-stable


## BUILD ##
FROM dart:stable AS build
WORKDIR /work

# Flutter
# Invalidates cache on version change
COPY --from=version flutter-stable flutter-stable
RUN set -x; read -r version sha < flutter-stable && \
    git clone --depth 1 --branch "$version" https://github.com/flutter/flutter.git /flutter && \
    test "$(git -C /flutter rev-parse HEAD)" = "$sha"
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Config
RUN dart --disable-analytics && \
    flutter config --no-analytics --enable-web && \
    flutter precache --web

# Config Flutter
COPY pubspec.yaml ./
RUN dart pub get

# TailwindCSS
ADD --chmod=0755 https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64 /tailwindcss

# Build
COPY . .
RUN dart run bin/main.dart release


## RUN ##
FROM nginxinc/nginx-unprivileged:alpine-slim
# Update nginx config
RUN sed -i '/^\s*#error_page\s*404/c\    error_page 404 /_404.html;' /etc/nginx/conf.d/default.conf

COPY --from=build /work/build /usr/share/nginx/html
