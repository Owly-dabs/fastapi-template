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
	aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 596576037598.dkr.ecr.ap-southeast-2.amazonaws.com
	docker build -t owlycodes/fastapi-template .
	docker tag owlycodes/fastapi-template:latest 596576037598.dkr.ecr.ap-southeast-2.amazonaws.com/owlycodes/fastapi-template:latest
	docker push 596576037598.dkr.ecr.ap-southeast-2.amazonaws.com/owlycodes/fastapi-template:latest
all: install lint test deploy