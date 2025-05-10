# Builder
FROM dart:stable AS builder
WORKDIR /work
COPY . .

### TailwindCSS
RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
RUN chmod +x tailwindcss-linux-arm64
RUN mv tailwindcss-linux-arm64 tailwindcss

### Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

## Config
RUN dart --disable-analytics
RUN flutter --disable-analytics
RUN flutter channel stable > /dev/null 2>&1
RUN flutter upgrade > /dev/null 2>&1
RUN flutter config --enable-web 2>&1
RUN dart pub get > /dev/null 2>&1

## Build
RUN dart run bin/main.dart release > /dev/null


# Runner
FROM nginx:slim AS runner
RUN sed -i '/^\s*#error_page\s*404/c\    error_page 404 /_404.html;' /etc/nginx/conf.d/default.conf

COPY --from=builder /work/build /usr/share/nginx/html