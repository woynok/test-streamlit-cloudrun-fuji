FROM python:3.10-bullseye as python-base

ENV PATH="/opt/poetry/bin/:${PATH}" \
    # POETRY_VERSION=1.1.14 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1

RUN curl -sSL https://install.python-poetry.org | python

FROM python-base as python-poetry-base
WORKDIR /opt/app
COPY app/ ./

RUN poetry install

ENTRYPOINT [ "streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0" ]

EXPOSE 8501
