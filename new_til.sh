#!/bin/bash

today=$(date +"%Y-%m-%d")
filename="_posts/${today}-til.md"

if [ -f "$filename" ]; then
  echo "⚠️ 오늘의 TIL 파일이 이미 존재합니다: $filename"
  idea "$filename"   # 이미 있으면 바로 열기
  exit 0
fi

cat > $filename <<EOF
---
layout: post
title: "${today} TIL"
categories: [ til ]
tags: [ ]
---

## 1. Todo

### Day 1
- [ ]

### Day 2
- [ ]

### Day 3
- [ ]

---

## 2. Retrospective
오늘 하루를 돌아보는 회고를 자유롭게 작성합니다.
EOF

echo "✅ 새 TIL 파일이 생성되었습니다: $filename"
idea "$filename"
