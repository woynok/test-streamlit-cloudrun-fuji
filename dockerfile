FROM 3.10-bullseye as python-base

RUN curl -sSL https://install.python-poetry.org | python
WORKDIR /opt/app
RUN copy app/ ./
RUN poetry install

EXPOSE 8501