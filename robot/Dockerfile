FROM python:2.7

ADD ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

ADD . /robot

WORKDIR /robot

ENV SELENIUM_REMOTE_URL http://localhost:4444/wd/hub
ENV APPLICATION_HOST localhost

CMD pybot -d out .
