#!/bin/bash

# 기본 포트
PORT=4000
LIVERELOAD_PORT=35729

# 기존 Jekyll 프로세스 종료
echo "🔍 기존 Jekyll 프로세스 확인 중..."
pids=$(lsof -ti :$PORT -sTCP:LISTEN; lsof -ti :$LIVERELOAD_PORT -sTCP:LISTEN)

if [ -n "$pids" ]; then
  echo "⚠️ 기존 Jekyll 프로세스 종료: $pids"
  kill -9 $pids
else
  echo "✅ 충돌 없음"
fi

# 새로 실행
echo "🚀 Jekyll 서버 시작: http://127.0.0.1:$PORT"
bundle exec jekyll serve --livereload --port $PORT --livereload-port $LIVERELOAD_PORT
