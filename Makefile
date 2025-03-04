build-html:
	git describe --abbrev=0 --tags | xargs -I % poetry version %
	poetry version --short > src/_version
	sphinx-build --write-all docs html

create-dev:
	pre-commit install
	pre-commit autoupdate
	rm -rf env
	python3.13 -m venv env
	( \
		. env/bin/activate; \
		pip install -r requirements.txt; \
		poetry install; \
		deactivate; \
	)

deploy-gh:
	ghp-import --no-jekyll --push --force --remote origin --branch gh-pages html
