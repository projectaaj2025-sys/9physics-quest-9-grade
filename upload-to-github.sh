#!/usr/bin/env bash
# =============================================================================
# Скрипт быстрой выгрузки проекта «Физика-Квест: Орбита-9» на GitHub
# =============================================================================

set -e

echo "=================================================="
echo "  🚀 Выгрузка «Физика-Квест: Орбита-9» на GitHub"
echo "=================================================="
echo ""

# Проверка наличия git
if ! command -v git &> /dev/null; then
    echo "❌ Ошибка: Git не установлен на вашем компьютере."
    echo "Установите Git: https://git-scm.com/downloads"
    exit 1
fi

# Инициализация репозитория, если ещё не инициализирован
if [ ! -d ".git" ]; then
    echo "📁 Инициализация локального Git-репозитория..."
    git init
    git branch -M main
fi

# Добавление всех файлов
echo "📦 Добавление файлов в коммит..."
git add .

# Проверка, есть ли изменения для коммита
if git diff --staged --quiet; then
    echo "ℹ️ Нет новых изменений для коммита."
else
    git commit -m "feat: инициализация проекта Физика-Квест Орбита-9 (9 класс)"
    echo "✅ Коммит создан успешно!"
fi

echo ""
echo "--------------------------------------------------"
echo "Куда выгрузить репозиторий?"
echo "1) Создайте новый репозиторий на https://github.com/new"
echo "   (например, с именем 'physics-quest-9-grade')"
echo "2) Вставьте ниже ссылку на репозиторий (HTTPS или SSH):"
echo "   Пример: https://github.com/ВАШ_ЛОГИН/physics-quest-9-grade.git"
echo "--------------------------------------------------"
read -p "Введите URL репозитория на GitHub (или Enter для пропуска): " REPO_URL

if [ -n "$REPO_URL" ]; then
    if git remote | grep -q "origin"; then
        git remote set-url origin "$REPO_URL"
    else
        git remote add origin "$REPO_URL"
    fi
    echo ""
    echo "🚀 Отправка файлов на GitHub..."
    git push -u origin main
    echo ""
    echo "🎉 Успешно выгружено на GitHub!"
    echo "Теперь включите GitHub Pages в Settings -> Pages -> Deploy from branch (main)."
else
    echo ""
    echo "Пропущено. Чтобы отправить вручную позже, выполните:"
    echo "  git remote add origin https://github.com/ВАШ_ЛОГИН/ИМЯ_РЕПОЗИТОРИЯ.git"
    echo "  git push -u origin main"
fi
