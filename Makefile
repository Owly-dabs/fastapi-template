install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
install-uv:
		uv pip install -r requirements.txt
format:
	# format code
	black *.py mylib/*.py
lint:
	# flake8 or pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	# test
	python -m textblob.download_corpora lite
	python -m pytest -vv --cov=mylib test_*.py
build:
	# build container
	docker build -t deploy-fastapi .
run:
	# run container
	docker run -p 127.0.0.1:8080:8080 deploy-fastapi
deploy:
	# deploy
all: install lint test deploy