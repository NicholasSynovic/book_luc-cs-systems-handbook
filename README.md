# Loyola CS Systems Handbook

The Loyola University Chicago CS Systems Handbook is a Sphinx-based
documentation project that captures operational knowledge about department
systems, services, labs, and support workflows for students, faculty, and
staff.

Published site: <https://systemshandbook.cs.luc.edu/>

## What This Project Contains

This repository is the source for the handbook website, including:

- Department service documentation (`src/department_services/`)
- ITS-related service guides (`src/its_services/`)
- Cluster/system documentation (`src/dijkstra/`, `src/prim/`)
- End-user how-to references (`src/how_to/`)

The docs entrypoint is `src/index.rst`, and Sphinx configuration lives in
`src/conf.py`.

## Project Stack

- Python 3.13+
- Sphinx
- Read the Docs theme (`sphinx-rtd-theme`)
- `uv` for environment/dependency management
- `pre-commit` for formatting, linting, and validation hooks

## Quick Start

### 1) Prerequisites

- Python 3.13
- `uv`
- `make`

### 2) Bootstrap a Development Environment

```bash
make create-dev
```

This command installs/updates pre-commit hooks, syncs dependencies via `uv`,
and runs a package build.

### 3) Build the Documentation Locally

```bash
make build-html
```

Generated HTML is written to `html/`.

## Build and Release Process

The canonical build target is in `Makefile`:

```bash
make build-html
```

Equivalent direct command:

```bash
sphinx-build --write-all src html
```

Release deployment uses:

```bash
make deploy-gh
```

The GitHub Actions workflow at `.github/workflows/build.yml` runs on tag pushes
and manual dispatch, then executes:

1. `make create-dev`
2. `make build-html`
3. `make deploy-gh`

## Quality Checks

Run all configured checks:

```bash
pre-commit run --all-files
```

Common individual hooks:

```bash
pre-commit run black --all-files
pre-commit run isort --all-files
pre-commit run flake8 --all-files
pre-commit run bandit --all-files
pre-commit run rstfmt --all-files
```

Recommended validation before submitting changes:

```bash
pre-commit run --all-files
make build-html
```

## Testing Notes

There is currently no dedicated test suite (no `pytest`/`tox`/`nox`
configuration). In practice, this project uses lint + docs build as its
validation pipeline.

Closest equivalent to a single-test run:

```bash
pre-commit run rstfmt --files src/how_to/command_line_basics.rst
```

## How to Continue Development

### Content updates

1. Add or edit `.rst` files under `src/`.
2. Update relevant toctrees (usually in `src/index.rst` or section indexes).
3. Build locally with `make build-html`.
4. Run `pre-commit run --all-files`.

### Structural updates

- Keep section organization aligned with existing categories:
  `department_services`, `its_services`, `how_to`, `dijkstra`, and `prim`.
- Ensure links and toctree entries remain relative and valid.
- Keep headings and `.rst` formatting consistent with surrounding content.

### Dependency/tooling updates

- Modify `pyproject.toml` as needed.
- Refresh lock state with `uv` workflows.
- Re-run `make create-dev` after significant tooling changes.

## Repository Conventions

- Python formatting: Black
- Import sorting: isort (Black profile)
- Linting: flake8
- Security scanning: bandit
- `.rst` formatting: rstfmt
- Encoding/line endings: UTF-8 with LF

See `AGENTS.md` for detailed instructions intended for autonomous coding agents.
