# fastapi-template
![AWS CodeBuild to ECR Pipeline](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiTllnUlhzdHhqa0w3MS9EOEEvM2FoL0dGMk1kU0R3ZzRwUS9DMjRDa1VCQnNscCttUmdJMVJtcmxRdStCMWNXbVJUR3FiWkgrOEloalB2YVY1M1R0UlRjPSIsIml2UGFyYW1ldGVyU3BlYyI6InpKdjBxdmc4azZ3L2dvb1giLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)
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
9. Setup linting, formatting, testing as shown in `Makefile`
10. Build basic cli `cli-fire.py` using Python Fire library `./cli-fire.py --help`
11. Code out the rest of the logic. Make tests such as `test_logic.py` and `test_main.py`
12. Code out Dockerfile and test building image and running container
13. Update `Makefile` and `aws.yml` to include building
14. To deploy to AWS, make a repository in ECR.
15. Copy push commands to deploy step in `Makefile`