#!/bin/bash
# Скрипт публикации на GitHub
# Использование: ./publish.sh YOUR_GITHUB_USERNAME

USERNAME=${1:-YOUR_USERNAME}
REPO_NAME="physics-quest-9-grade"

echo "=== Физика-Квест: Орбита-9 — публикация на GitHub ==="
echo "Username: $USERNAME"
echo "Repo: $REPO_NAME"

if [ "$USERNAME" = "YOUR_USERNAME" ]; then
  echo "⚠️  Укажи свой ник: ./publish.sh твой_ник"
  exit 1
fi

# Проверяем что мы в папке проекта
if [ ! -f "index.html" ]; then
  echo "❌ Запусти скрипт из папки physics-quest-9-grade/"
  exit 1
fi

git init
git add .
git commit -m "feat: initial release - Orbit-9, 48 levels, teacher mode, 3 languages"
git branch -M main
git remote add origin https://github.com/$USERNAME/$REPO_NAME.git
echo "→ Пушу на GitHub..."
git push -u origin main

echo "✅ Готово!"
echo "→ Включи GitHub Pages: https://github.com/$USERNAME/$REPO_NAME/settings/pages"
echo "   Source: GitHub Actions"
echo "→ Сайт будет: https://$USERNAME.github.io/$REPO_NAME/"
