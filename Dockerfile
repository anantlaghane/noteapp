
FROM python:3.9
WORKDIR /app/backend
COPY requirements.txt /app/backend
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev && pip install --no-cache-dir -r requirements.txt
COPY . /app/backend
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
