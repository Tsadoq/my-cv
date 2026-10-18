# CV

My personal CV, built with the [Awesome-CV](https://github.com/posquit0/Awesome-CV) LaTeX template.

## Download

[**Download the latest PDF**](https://github.com/tsadoq/my-cv/releases/latest/download/cv.pdf) — auto-built from `main` on every push.

[![Build CV](https://github.com/tsadoq/my-cv/actions/workflows/build-cv.yml/badge.svg)](https://github.com/tsadoq/my-cv/actions/workflows/build-cv.yml)

## Build locally

Needs a TeX Live with XeLaTeX (MacTeX works) and, for `preview`/`check`, poppler (`brew install poppler`). All fonts are vendored in `fonts/`.

```sh
make          # cv.pdf
make preview  # page-1.png, page-2.png
make check    # ATS sanity: ASCII hyphens, titles extract in normal case, 2 pages
```

## Layout

| File | Content |
|---|---|
| `cv.tex` | preamble, layout rules, helper macros (`\joborrole`, `\kpi`, `\lineitem`), header |
| `resume/summary.tex` | 3-line positioning statement |
| `resume/skills.tex` | skills block (only tools evidenced elsewhere in the CV) |
| `resume/experience.tex` | full-time roles, strictly reverse chronological |
| `resume/advisory.tex` | concurrent part-time roles (advisory, teaching) |
| `resume/projects.tex` | open source, one line + link each |
| `resume/education.tex`, `certifications.tex`, `volunteering.tex`, `languages.tex` | the rest |

## Writing rules

- **Bullets**: result first, then how. One idea per bullet, at most two lines. Pattern: "Did X, measured by Y, by doing Z".
- **Emphasis**: one `\kpi{...}` per bullet, on the quantified outcome, never on the verb.
- **Tense**: present for ongoing responsibilities in current roles, past for completed achievements and for all past roles.
- **Dates**: `Mon YYYY -- Present` (en dash). Current roles say "Present", not "Now".
- **Numbers**: numerals; give a baseline whenever one exists (ms, %, before/after). A number that undersells is worse than no number.
- **Names**: Elasticsearch, CrewAI, DeepLearning.AI, Hacker News, scikit-learn, multi-agent, cofounder.
- **Avoid**: end-to-end, modern, high-performance, from scratch, self-built, "as measured by ... by owning", internal level labels such as "(L7)".
- **Sections**: keep it at two pages. Certifications and volunteering are one line each.

## Credit

- [LaTeX](http://www.latex-project.org) and XeLaTeX.
- [latex-fontawesome](https://github.com/furl/latex-fontawesome) bindings; `fontawesome.sty` is vendored here so the glyph font loads from `fonts/` without a system install.
- [Roboto](https://github.com/google/roboto) (header) and [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro) (body).
- [Awesome-CV](https://github.com/posquit0/Awesome-CV) template, CC BY-SA 4.0.
