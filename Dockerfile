FROM python:3.10-bullseye as python-base

RUN curl -sSL https://install.python-poetry.org | python
ENV PATH="/root/.local/bin/:${PATH}"

FROM python-base as python-poetry-base
WORKDIR /opt/app
COPY app/ ./
RUN poetry install


ENTRYPOINT [ "streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0" ]

EXPOSE 8501
