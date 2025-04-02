# Mock
FROM dart:stable AS mocker

COPY bin/mock/bingo .

RUN ls bingo
RUN git clone https://github.com/V4ldum/bingo

RUN dart --disable-analytics 
RUN flutter --disable-analytics 

RUN dart run build_runner build
RUN flutter analyze


# Build
FROM dart:stable AS builder
WORKDIR /work

COPY --from=mocker bingo/main.dart /tmp/main.dart
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