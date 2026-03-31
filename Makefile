build-html:
	git describe --abbrev=0 --tags | xargs -I % uv version %
	uv version --short > src/_version
	sphinx-build --write-all src html

create-dev:
	pre-commit install
	pre-commit autoupdate
	uv sync
	uv build

deploy-gh:
	ghp-import --no-jekyll --push --force --remote origin --branch gh-pages html
