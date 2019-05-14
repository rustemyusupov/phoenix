# Use an official Elixir runtime as a parent image
# FROM elixir:latest

# RUN apt-get update && \
#   apt-get install -y postgresql-client inotify-tools

FROM elixir:alpine

COPY wait-for-it.sh /usr/bin/wait-for-it.sh

RUN set xe && \
  apk add --no-cache postgresql-client inotify-tools bash && \
  chmod +x /usr/bin/wait-for-it.sh && \
  rm -rf /var/cache/apk/*

# Create app directory and copy the Elixir projects into it
# RUN mkdir /app
# COPY ./app /app
WORKDIR /app


# Install hex package manager and rebar (was required after test)
RUN mix local.hex --force && mix local.rebar --force
# RUN /root/.mix/rebar3 local install

# Compile the project
# RUN mix do compile

#CMD ["/app/entrypoint.sh"]