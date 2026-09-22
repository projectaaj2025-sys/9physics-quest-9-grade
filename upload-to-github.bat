@echo off
chcp 65001 >nul
echo ==================================================
echo   🚀 Выгрузка «Физика-Квест: Орбита-9» на GitHub
echo ==================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Ошибка: Git не установлен или не добавлен в PATH.
    echo Скачайте и установите Git: https://git-scm.com/downloads
    pause
    exit /b 1
)

if not exist ".git" (
    echo 📁 Инициализация локального Git-репозитория...
    git init
    git branch -M main
)

echo 📦 Добавление файлов в коммит...
git add .
git commit -m "feat: инициализация проекта Физика-Квест Орбита-9 (9 класс)" >nul 2>nul
echo ✅ Коммит подготовлен!
echo.
echo --------------------------------------------------
echo 1) Создайте репозиторий на https://github.com/new
echo    (например, physics-quest-9-grade)
echo 2) Скопируйте ссылку на него и вставьте ниже:
echo    Пример: https://github.com/ВАШ_ЛОГИН/physics-quest-9-grade.git
echo --------------------------------------------------
set /p REPO_URL="Введите URL репозитория на GitHub (или Enter для выхода): "

if not "%REPO_URL%"=="" (
    git remote remove origin >nul 2>nul
    git remote add origin %REPO_URL%
    echo.
    echo 🚀 Отправка файлов на GitHub...
    git push -u origin main
    echo.
    echo 🎉 Успешно выгружено на GitHub!
    echo Теперь включите GitHub Pages: Settings -> Pages -> Deploy from branch (main).
) else (
    echo.
    echo Команды для ручной отправки:
    echo   git remote add origin https://github.com/ВАШ_ЛОГИН/ИМЯ_РЕПОЗИТОРИЯ.git
    echo   git push -u origin main
)

echo.
pause
