# AGENTS.md

Practical guide for agentic coding assistants operating in this repository.

## Repository at a Glance
- Stack: Python + Sphinx documentation project.
- Main content root: `src/`.
- Sphinx configuration: `src/conf.py`.
- Build artifact directory: `html/`.
- Dependency manager: `uv`.
- Python constraint: `>=3.13,<4.0`.

## Key Files
- `pyproject.toml`: project metadata and dependency constraints.
- `uv.lock`: locked dependency versions.
- `Makefile`: canonical setup/build/deploy commands.
- `.pre-commit-config.yaml`: lint, format, security, and `.rst` hooks.
- `.isort.cfg`: import sorting policy (`profile = black`, `line_length = 79`).
- `.editorconfig`: indentation, encoding, newline, whitespace conventions.
- `.github/workflows/build.yml`: CI build + deploy workflow.
- `src/index.rst`: root toctree and documentation navigation.

## Cursor and Copilot Rules
- Checked `.cursor/rules/`: not present.
- Checked `.cursorrules`: not present.
- Checked `.github/copilot-instructions.md`: not present.
- No repository-local Cursor or Copilot instruction files currently exist.

## Setup Commands
- Preferred bootstrap:

```bash
make create-dev
```

- `make create-dev` performs:
- `pre-commit install`
- `pre-commit autoupdate`
- `uv sync`
- `uv build`

## Build Commands
- Canonical documentation build:

```bash
make build-html
```

- Equivalent direct build:

```bash
sphinx-build --write-all src html
```

- Publish docs (release flow):

```bash
make deploy-gh
```

## Lint / Format / Security Commands
- Run all configured checks:

```bash
pre-commit run --all-files
```

- Run one hook on all files:

```bash
pre-commit run black --all-files
pre-commit run isort --all-files
pre-commit run flake8 --all-files
pre-commit run bandit --all-files
pre-commit run rstfmt --all-files
```

- Run one hook on selected files:

```bash
pre-commit run black --files src/conf.py
pre-commit run rstfmt --files src/index.rst
```

## Test Commands (Current State)
- No test framework is configured in this repository right now.
- No `pytest.ini`, `tox.ini`, `noxfile.py`, or `tests/` directory exists.
- Treat lint + docs build as the validation pipeline.

Recommended validation sequence:

```bash
pre-commit run --all-files
make build-html
```

## Running a Single Test
- True single-test execution is not available yet (no test runner configured).
- Closest equivalent: run a single hook against a single file:

```bash
pre-commit run rstfmt --files src/how_to/command_line_basics.rst
```

- If pytest is added later, use patterns like:

```bash
pytest tests/test_file.py::test_name
pytest -k "keyword"
```

## Code Style Guidelines

### General
- Keep changes scoped, minimal, and task-focused.
- Avoid broad refactors unless explicitly requested.
- Preserve current directory layout and document organization.

### Python Formatting and Linting
- Format with Black (via pre-commit).
- Sort imports with isort using the Black profile.
- Lint Python with flake8.
- Run security checks with bandit.
- Follow 4-space indentation for Python files.
- Prefer the existing 79-character line-length convention.

### Imports
- Order imports as stdlib, third-party, then local.
- Let isort handle final ordering.
- Avoid wildcard imports.

### Types
- No strict type checker is currently configured.
- Add type hints to new public functions when useful.
- Prefer built-in generics (`list[str]`, `dict[str, str]`).

### Naming
- Python functions/variables/modules: `snake_case`.
- Constants: `UPPER_SNAKE_CASE`.
- `.rst` files: lowercase names with underscores.
- Keep section title capitalization consistent inside each document.

### Error Handling
- Fail fast on unrecoverable configuration or build issues.
- Prefer specific exceptions over broad `except Exception`.
- Do not silently swallow exceptions.
- Include actionable context in error messages.

### ReStructuredText
- Format `.rst` files with `rstfmt`.
- Use 3-space indentation for `.rst` content blocks.
- Keep heading adornments consistent within a file.
- Keep toctree references relative and valid.

### Whitespace and Encoding
- Encoding: UTF-8.
- Line endings: LF.
- Trim trailing whitespace.
- Ensure files end with a newline.

## CI Behavior
- Workflow file: `.github/workflows/build.yml`.
- Triggered by tag pushes and manual dispatch.
- CI runs `make create-dev`, `make build-html`, then `make deploy-gh`.

## Agent Working Agreement
- Before finishing substantial changes, run:

```bash
pre-commit run --all-files
make build-html
```

- Include hook-generated changes in the final patch.
- Do not add new tooling (pytest/ruff/mypy/etc.) unless requested.
- Do not modify deployment behavior unless explicitly requested.
- Avoid committing generated artifacts (`html/`, `dist/`) unless required.
