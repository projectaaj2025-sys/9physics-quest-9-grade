# Деплой на GitHub — пошаговая инструкция

## Вариант A: Через веб-интерфейс GitHub (самый простой, без git)

1. Зайди на https://github.com/new
2. Название репозитория: `physics-quest-9-grade`
3. Описание: `Физика-Квест: Орбита-9 — образовательная RPG по физике 9 класса`
4. Выбери Public, НЕ ставь галочку Add README (у нас уже есть)
5. Нажми Create repository
6. На странице нового репозитория нажми **uploading an existing file**
7. Перетащи ВСЕ файлы из папки `physics-quest-9-grade/` (или загрузи ZIP и распакуй через веб — лучше файлы по отдельности)
   - Обязательно: `index.html`, `README.md`, `.gitignore`, `LICENSE`, папку `.github`
8. Commit: `Initial release`
9. Перейди в `Settings → Pages`
   - Source: **GitHub Actions**
   - Сохрани
10. Перейди в `Actions` — должен запуститься workflow `Deploy to GitHub Pages`
11. Через 1-2 минуты сайт будет доступен по адресу:
    `https://ТВОЙ_НИК.github.io/physics-quest-9-grade/`

## Вариант B: Через командную строку (git)

```bash
# 1. Распакуй архив physics-quest-9-grade.zip
# 2. Зайди в папку
cd physics-quest-9-grade

# 3. Инициализируй git
git init
git add .
git commit -m "feat: initial release Orbit-9 - 48 levels, teacher mode"

# 4. Создай репозиторий на github.com/new (без README)
# 5. Привяжи remote (замени YOUR_USERNAME)
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/physics-quest-9-grade.git
git push -u origin main
```

Дальше включи Pages как в пункте 9 варианта A.

## Вариант C: GitHub Desktop

1. File → Add local repository → выбери папку `physics-quest-9-grade`
2. Publish repository → выбери имя, Public
3. Включи Pages в настройках на сайте.

## Проверка

- Открой `https://YOUR_USERNAME.github.io/physics-quest-9-grade/`
- Должен загрузиться экран с кнопкой «Начать игру»
- Проверь на телефоне — должен появиться джойстик

## Частые проблемы

- **404 на Pages:** подожди 2-3 минуты, проверь что в Settings → Pages стоит GitHub Actions, а не Branch
- **Не грузится index.html:** убедись что файл в корне репозитория, а не в папке
- **Cloudflare скрипты:** в этом репозитории они уже удалены из index.html

## Обновление игры

Если ты исправил `index.html`:

```bash
git add index.html
git commit -m "fix: update level 5"
git push
```

GitHub Actions автоматически пересоберет сайт за 30-60 сек.

## Альтернативные хостинги

Этот `index.html` — полностью автономный, его можно загрузить куда угодно:

- **Netlify:** перетащи папку на https://app.netlify.com/drop
- **Vercel:** `npx vercel --prod`
- **Тильда / WordPress:** загрузи как HTML-блок
- **Moodle / Google Classroom:** прикрепи как файл или ссылку
- **Любой хостинг:** просто залей index.html по FTP
