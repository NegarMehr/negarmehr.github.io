# Repository Guidelines

## Project Structure & Module Organization
- Jekyll site built on the al-folio theme.
- Content lives in collection folders: `_pages/` (site pages), `_posts/` (blog posts), `_projects/` (projects), `_news/` (news items), `_bibliography/` (publications in `papers.bib`).
- Configuration and data live in `_config.yml` and `_data/` (for example `cv.yml`, `repositories.yml`, `coauthors.yml`).
- Layouts and templating: `_layouts/` and `_includes/` (Liquid templates).
- Styling: `_sass/` (SCSS partials) and `assets/` (images, PDFs, JSON resume at `assets/json/resume.json`).
- Built output is `_site/` (generated, do not edit by hand).

## Build, Test, and Development Commands
- `docker compose pull` then `docker compose up`: run the site locally via Docker (recommended). Site at `http://localhost:8080`.
- `docker compose up --build`: rebuild the Docker image if Ruby/Jekyll dependencies change.
- `bundle install` then `bundle exec jekyll serve --lsi`: legacy local setup without Docker. Site at `http://localhost:4000`.
- `bundle exec jekyll build --lsi`: generate the static site into `_site/` for non–GitHub Pages hosting.
- `purgecss -c purgecss.config.js`: optional CSS purge on the built site (`_site/assets/css`).

## Coding Style & Naming Conventions
- YAML uses 2-space indentation; follow existing key ordering in `_config.yml` and `_data/*.yml`.
- Blog posts must be named `YYYY-MM-DD-title.md` in `_posts/` with proper front matter.
- Keep SCSS changes in `_sass/` and avoid editing compiled CSS directly.
- Prettier (with `@shopify/prettier-plugin-liquid`) is the formatting tool used in CI; align formatting with existing files.

## Testing Guidelines
- There are no unit tests; quality checks are done via GitHub Actions.
- CI runs Prettier and `lychee` (broken-link checks). Accessibility checks with Axe are manual.
- Always verify changes by running the site locally (`jekyll serve` or Docker) before pushing.

## Commit & Pull Request Guidelines
- Recent commits use short, sentence-style messages without a strict convention; keep messages concise and descriptive (e.g., “Update CV entries”).
- For minor fixes, submit a PR directly. For features/bugs, open an issue first and link it in the PR description.
- Include screenshots for UI-visible changes and note any config changes (like `_config.yml`) in the PR body.

## Configuration Tips
- Set `url` and `baseurl` correctly in `_config.yml` before building/deploying.
- For CV content, use `assets/json/resume.json` or `_data/cv.yml` (JSON takes priority).
## Navigation Overrides
- Top-nav items come from `_pages/*.md` with `nav: true` and are rendered by `_includes/header.liquid`.
- To point a nav item to an external site, add `external_url: https://example.com/path/` in the page front matter (for example `_pages/publications.md`). The navbar will use this URL instead of the local permalink.
