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
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 596576037598.dkr.ecr.us-east-1.amazonaws.com
	docker build -t owlydabs/wikipedia-api .
	docker tag owlydabs/wikipedia-api:latest 596576037598.dkr.ecr.us-east-1.amazonaws.com/owlydabs/wikipedia-api:latest
	docker push 596576037598.dkr.ecr.us-east-1.amazonaws.com/owlydabs/wikipedia-api:latest
all: install lint test deploy