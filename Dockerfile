FROM python:3.12-slim

RUN mkdir /app
WORKDIR /app

COPY requirements.txt entrypoint.sh ./

RUN chmod +x /app/entrypoint.sh

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/app/entrypoint.sh"]

