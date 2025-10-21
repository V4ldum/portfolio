FROM dart:stable AS build
WORKDIR /work
COPY . .

# TailwindCSS
RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
RUN mv tailwindcss-linux-x64 tailwindcss
RUN chmod +x tailwindcss

# Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Config
RUN dart --disable-analytics
RUN flutter --disable-analytics
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN dart pub get

# Build
RUN dart run bin/main.dart release


FROM nginx:alpine-slim
# Update nginx config
RUN sed -i '/^\s*#error_page\s*404/c\    error_page 404 /_404.html;' /etc/nginx/conf.d/default.conf

COPY --from=build /work/build /usr/share/nginx/html
