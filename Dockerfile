FROM ruby:2.6.6
SHELL ["/bin/bash", "-c", "-l"]
ENV DEBIAN_FRONTEND noninteractive
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update &&  apt-get install -y \
     build-essential \
     vim \
     tmux \
     git \
     make \
     nodejs \
     yarn \
     postgresql \
     postgresql-contrib \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* 
# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
# default.

COPY dot-files/* /root
WORKDIR /code
COPY Gemfile /code/Gemfile
RUN gem install bundler && bundle install --jobs 20 --retry 5 
EXPOSE 3000
# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
CMD service postgresql start && /bin/bash
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
