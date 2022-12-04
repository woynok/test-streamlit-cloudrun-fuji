FROM python:3.10-bullseye as python-base

RUN curl -sSL https://install.python-poetry.org | python
WORKDIR /opt/app
RUN copy app/ ./
RUN poetry install

ENTRYPOINT [ "streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0" ]

EXPOSE 8501
