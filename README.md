# fastapi-template
[![Python application test with Github Actions](https://github.com/Owly-dabs/fastapi-template/actions/workflows/aws.yml/badge.svg)](https://github.com/Owly-dabs/fastapi-template/actions/workflows/aws.yml)

## Development steps
1. Create virtual env `uv venv`
2. Create empty files: `Makefile`, `Dockerfile`, `requirements.txt`, `.gitignore`
3. Populate Makefile
4. Install dependencies with `make install`. 
5. Update `requirements.txt` with version using `uv pip freeze | less` 
6. Add ci: Go to Github repo > Actions > AWS
7. Populate `aws.yml` and check ci is working
8. Add ci status badge to `README.md` from Actions > ... 