FROM python:2.7

ADD ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

ADD . /robot

WORKDIR /robot

ENV SELENIUM_REMOTE_URL http://selenium:4444/wd/hub
ENV APPLICATION_HOST application

CMD pybot -d out .
