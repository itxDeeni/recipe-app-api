FROM python:3.9-1lpine3.13
LABEL maintainer="@itxdeeni"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /pu && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install /tmp/requirements.txt && \
    rm -rf /tmp && \ 
    adduser \
        --disabled-password \ 
        --no-create-home \ 
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user