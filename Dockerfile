# Mock
FROM debian:bookworm-slim AS mocker

## Setup
RUN apt-get update -qq && \
    apt-get install -y -qq git curl unzip
RUN git clone https://github.com/flutter/flutter.git
RUN /flutter/bin/flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

## Config
RUN dart --disable-analytics
RUN flutter --disable-analytics
RUN flutter channel stable > /dev/null 2>&1
RUN flutter upgrade > /dev/null 2>&1
RUN flutter config --enable-web 2>&1

## Build Mocks
### Bingo
RUN git clone https://github.com/V4ldum/bingo
WORKDIR /bingo
RUN rm lib/main.dart
RUN rm lib/env.dart
COPY bin/mock/bingo lib
RUN dart run build_runner build | grep -Ev "^\[INFO\]"
RUN flutter build web --release -base-href /demo/bingo/ > /dev/null 2>&1


# Build
FROM dart:stable AS builder
WORKDIR /work

COPY . .

RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
RUN chmod +x tailwindcss-linux-arm64
RUN mv tailwindcss-linux-arm64 tailwindcss

RUN dart --disable-analytics 
RUN dart pub get > /dev/null 2>&1

RUN dart run bin/main.dart > /dev/null


# Run
FROM nginx:alpine AS runner
RUN sed -i '/^\s*#error_page\s*404/c\    error_page 404 /_404.html;' /etc/nginx/conf.d/default.conf

COPY --from=builder /work/build /usr/share/nginx/html
COPY --from=mocker /bingo/build/web /usr/share/nginx/html/demo/bingo