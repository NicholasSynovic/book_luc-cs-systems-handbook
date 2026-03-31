Guidance for coding agents working in `book_luc-cs-systems-handbook`.

## 1) Purpose and Stack

- This repository is a docs-first Sphinx handbook for CS systems/services.
- Primary authored content is in `docs/` as reStructuredText (`.rst`).
- Toolchain: Python, Poetry, Make, pre-commit, and GitHub Actions.
- Deployment uses `ghp-import` to publish `html/` to `gh-pages`.
- `pyproject.toml` has `tool.poetry.package-mode = false` (not a library package).

## 2) Source of Truth Files

- Build and deploy commands: `Makefile`.
- Python/runtime constraints: `pyproject.toml` and `poetry.lock`.
- Bootstrap deps: `requirements.txt`.
- Formatting/lint gates: `.pre-commit-config.yaml`.
- Import style details: `.isort.cfg`.
- Markdown lint overrides: `.markdownlint.json`.
- CI workflows: `.github/workflows/build.yml`, `.github/workflows/pre-commit.yml`.
- Sphinx runtime config: `docs/conf.py`.

## 3) Environment Setup

- Required Python range: `>=3.13,<4.0`.
- Recommended local setup:
  - `python3.13 -m venv env`
  - `source env/bin/activate`
  - `pip install -r requirements.txt`
  - `poetry install`
- Canonical bootstrap command: `make create-dev`.

## 4) Build, Lint, and Test Commands

### Build

- `make build-html`
  - syncs Poetry version from latest git tag,
  - writes short version to `src/_version`,
  - runs `sphinx-build --write-all docs html`.
- `make deploy-gh` publishes built docs to `gh-pages`.

### Lint / Format

- Run all checks: `pre-commit run --all-files`.
- Run checks on changed files: `pre-commit run`.
- Individual hooks:
  - `pre-commit run black --all-files`
  - `pre-commit run isort --all-files`
  - `pre-commit run flake8 --all-files`
  - `pre-commit run bandit --all-files`
  - `pre-commit run rstfmt --all-files`
  - `pre-commit run mdformat --all-files`

### Test

- There is currently no first-class test suite in this repository.
- No `pytest.ini`, `tox.ini`, or `tests/` directory is present.
- Effective quality gates are:
  - `pre-commit run --all-files`
  - `make build-html`

### Running a Single Test (Important)

- Current status: not applicable because no tests are defined.
- If pytest tests are introduced, use:
  - file: `poetry run pytest path/to/test_file.py`
  - single test: `poetry run pytest path/to/test_file.py::test_name`
  - unittest style: `poetry run pytest path/to/test_file.py::TestClass::test_method`

## 5) Code Style Guidelines

### Python Formatting and Linting

- Use `black` for formatting Python.
- Use `isort` for imports with `profile = black`.
- `isort` is configured with `line_length = 79`.
- Use `flake8` for linting and `bandit` for security checks.

### Imports

- Import grouping order: stdlib, third-party, local.
- Separate groups with one blank line.
- Let automated tools own final ordering/wrapping.

### Types

- Add type hints for new Python where practical.
- Prefer built-in generics (`list[str]`, `dict[str, int]`).
- Keep type usage consistent within each file.

### Naming

- Python modules: `snake_case.py`.
- Functions/variables: `snake_case`.
- Classes: `PascalCase`.
- Constants: `UPPER_SNAKE_CASE`.
- Make targets: short, verb-forward (`build-html`, `create-dev`).

### Error Handling

- Fail fast on unrecoverable paths.
- Raise specific exceptions instead of broad `Exception`.
- Add context when re-raising.
- Avoid silent `except` blocks.

### Shell Scripts

- Existing scripts in `scripts/*.bash` are lightweight operational helpers.
- For new scripts, prefer:
  - `set -euo pipefail`
  - quoted variable expansions
  - straightforward control flow over dense one-liners

### Docs Authoring

- `.rst` is the primary doc format.
- Keep heading levels and toctrees aligned with `docs/index.rst`.
- Run `rstfmt` before finalizing `.rst` edits.
- Markdown (e.g., ADRs) is formatted with `mdformat`.
- `.markdownlint.json` disables MD007, MD013, and MD030.

## 6) CI Expectations

- Tag pushes run the build/deploy workflow.
- Pre-commit automation exists in GitHub Actions.
- Keep local changes aligned with CI by running:
  - `pre-commit run --all-files`
  - `make build-html`

## 7) Agent Workflow Expectations

- Inspect nearby docs/config before editing.
- Keep changes focused and avoid unrelated churn.
- Preserve `docs/` structure and existing conventions.
- If build logic changes, verify with `make build-html` when possible.
- If new tooling/conventions are added, update this file in the same change.

## 8) Cursor and Copilot Rule Files

- Checked for `.cursorrules`: not present.
- Checked for `.cursor/rules/`: not present.
- Checked for `.github/copilot-instructions.md`: not present.
- This `AGENTS.md` is therefore the in-repo instruction source for coding agents.

## 9) Missing Information Policy

- If a requested command is missing, use existing Make/pre-commit flows.
- If asked for tests, state there is no test suite yet and use build/lint gates.
- When introducing conventions, encode them in config and document them here.

## 10) Quick Commands

- `make create-dev` - create venv, install deps, configure hooks.
- `make build-html` - build Sphinx HTML output.
- `make deploy-gh` - publish `html/` to `gh-pages`.
- `pre-commit run` - run checks on changed files.
- `pre-commit run --all-files` - run checks on all files.
- Future single-test pattern: `poetry run pytest path/to/test_file.py::test_name`.
