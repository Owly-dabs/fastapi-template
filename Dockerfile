FROM python:3.11-slim

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

RUN python -m textblob.download_corpora lite

COPY . /app

EXPOSE 8080

ENTRYPOINT ["python"]

CMD ["main.py"]