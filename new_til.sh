#!/usr/bin/env bash

set -euo pipefail

# 스크립트 위치를 기준으로 저장 경로 고정 (어디서 실행해도 동작)
script_dir="$(cd "$(dirname "$0")" && pwd)"
posts_dir="$script_dir/_posts/til"

today=$(date +"%Y-%m-%d")
filename="$posts_dir/${today}-til.md"

mkdir -p "$posts_dir"

if [ -f "$filename" ]; then
  echo "⚠️ 오늘의 TIL 파일이 이미 존재합니다: $filename"
  # 이미 있으면 바로 열기 (가능한 에디터 우선순위: idea > code > open)
  if command -v idea >/dev/null 2>&1; then
    idea "$filename"
  elif command -v code >/dev/null 2>&1; then
    code -r "$filename"
  elif command -v open >/dev/null 2>&1; then
    open "$filename"
  fi
  exit 0
fi

cat > "$filename" <<EOF
---
layout: post
title: "${today} TIL"
categories: [ til ]
tags: [ til ]
description: "Today I Learned"
published: false
---

## 1. Todo

- [ ] ()[]

---

## 2. Retrospective
오늘 하루를 돌아보는 회고를 자유롭게 작성합니다.
EOF

echo "✅ 새 TIL 파일이 생성되었습니다: $filename"

# 새 글 접근 URL을 안내 (site permalink 규칙에 맞춤)
echo "🔗 URL: /posts/${today}-til/"

# 파일 열기 (가능한 에디터 우선순위: idea > code > open)
if command -v idea >/dev/null 2>&1; then
  idea "$filename"
elif command -v code >/dev/null 2>&1; then
  code -r "$filename"
elif command -v open >/dev/null 2>&1; then
  open "$filename"
fi
