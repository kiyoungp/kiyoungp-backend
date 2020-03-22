FROM python:3.6.2

#Docker build 명령어로 docker image를 빌드할때 설정할 수 있는 옵션 지
ARG CONTAINER_ENV=production

#Environment variable 지정
ENV PYTHONUNBUFFERED 1
ENV CONTAINER_ENV ${CONTAINER_ENV}

#Working directory
WORKDIR /app
COPY requirements.txt  /app
COPY requirements-dev.txt  /app

#Pakage install
RUN \
if [ $CONTAINER_ENV = 'production' ]; then \
  pip install -r requirements.txt ; \
else \
  pip install -r requirements-dev.txt ; \
fi

COPY gunicorn /app/gunicorn
COPY sql /app/sql
COPY kiyoungp /app/kiyoungp
COPY manage.py /app

#Docker container가 시작할때 실행할 커맨드 지
CMD bash -c " \
  python manage.py migrate && \
  gunicorn kiyoungp.wsgi -c $GUNICORN_SETTINGS_FILE"
