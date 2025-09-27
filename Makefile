install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh
install:
	uv pip install --upgrade pip &&\
		uv pip install -r requirements.txt
setup: install-uv install
	@echo "Setup complete! uv installed and dependencies ready."
format:
	# format code
lint:
	# flake8 or pylint
test:
	# test
deploy:
	# deploy
all: install lint test deploy