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

RUN find /usr/local/lib/python3.10/site-packages/streamlit -type f \( -iname \*.py -o -iname \*.js \) -print0 | xargs -0 sed -i 's/healthz/health-check/g'

# https://github.com/streamlit/streamlit/issues/484
# https://github.com/UTDNebula/comet-circle/pull/10
ENTRYPOINT [ "streamlit", "run", "main.py", "--server.port=8080", "--server.address=0.0.0.0", "--server.maxMessageSize=20", "--server.enableCORS=False", "--server.enableXsrfProtection=False" ]

EXPOSE 8080
