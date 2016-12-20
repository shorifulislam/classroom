## BUILDING
##   (from project root directory)
##   $ docker build -t ruby-2-3-3-on-minideb .
##
## RUNNING
##   $ docker run -p 3000:3000 ruby-2-3-3-on-minideb
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r7

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="lsxg31o" \
    STACKSMITH_STACK_NAME="Ruby 2.3.3 on minideb" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 zlib1g libreadline6 libncurses5 libtinfo5 libffi6 libxml2-dev zlib1g-dev libxslt1-dev libgmp-dev ghostscript imagemagick libmysqlclient18 libpq5 libpq-dev


RUN bitnami-pkg install ruby-2.3.3-1 --checksum 107c8f5e76b77a351cfb7e3e544f9b86b8633eae563f179349137cab70b8d841

ENV PATH=/opt/bitnami/ruby/bin:$PATH

# Ruby on Rails template
ENV RAILS_ENV=development

COPY Gemfile* /app/
WORKDIR /app

RUN bundle install --without production

COPY . /app

# EXPOSE 3000

CMD ["bundle", "exec", "rails", "db:setup"]
