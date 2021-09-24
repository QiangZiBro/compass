FROM ufoym/deepo:all-py36-cu111

WORKDIR /workspace
COPY requirements.txt .
RUN apt-get update && apt-get install -y python3.6-dev build-essential libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev
RUN pip install --upgrade pip && pip install -r requirements.txt
