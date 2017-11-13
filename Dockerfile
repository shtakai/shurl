FROM ruby:2.4.2
RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc
RUN apt-get update && \
    apt-get install -y  --no-install-recommends \
      postgresql-client \
			nodejs \
      && \
      rm -rf /var/lib/apt/lists/*
RUN useradd appuser --create-home && \
    mkdir -p /app && \
    chown -R appuser /usr/local/bundle
WORKDIR /app
USER appuser
COPY Gemfile Gemfile.lock /app/
RUN bundle install --without development test --jobs=4
COPY . /app/
USER root
RUN chown -R appuser /app
USER appuser
RUN mkdir -p \
      /app/log \
      /app/public/assets/ \
      /app/tmp/cache/assets/ \
      /app/tmp/sockets/
ENV RAILS_ENV=staging
ENV RAILS_LOG_TO_STDOUT=1
ENV RAILS_SERVE_STATIC_FILES=1
RUN ["bin/rake", "assets:precompile"]
EXPOSE 3000
