build:
	git --no-pager tag | rev | col | cut -d ' ' -f 1 | rev | xargs -I % poetry version %
	git --no-pager tag | rev | col | cut -d ' ' -f 1 | rev > docs/_version
	sphinx-build -M html docs dist --write-all

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
