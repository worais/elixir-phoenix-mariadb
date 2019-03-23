FROM elixir:latest

MAINTAINER MORAIS JUNIOR <geekdoagrest@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes mysql-client

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs

RUN mkdir /app
ADD . /app
WORKDIR /app
