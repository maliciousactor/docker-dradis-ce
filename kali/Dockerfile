FROM kalilinux/kali-linux-docker
LABEL maintainer "Christopher Snyder" <34378288+maliciousactor@users.noreply.github.com>

# environment config
ENV APT_ARGS="-y --no-install-recommends --no-upgrade -o Dpkg::Options::=--force-confnew"
ENV RAILS_ENV development

# install dependencies
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install $APT_ARGS \
        build-essential \
        gcc \
        git \
        libmariadb-dev \
        libsqlite3-dev \
        make \
        nodejs \
        patch \
        ruby-full \
        wget \
        zlib1g-dev

# fetch and configure dradis
RUN git clone https://github.com/dradis/dradis-ce.git /app && \
    sed -i 's/rake (12.3.2)/rake (12.3.3)/' /app/Gemfile.lock && \
    sed -i "s/ruby '2.4.1'/ruby '\>\= 2.4.1'/" /app/Gemfile && \
    sed -i 's@database:\s*db@database: /data@' /app/config/database.yml.template && \
    sed -i 's/config.force_ssl = true/config.force_ssl = false/' /app/config/environments/production.rb && \
    sed -i 's/:uglifier/Uglifier.new(harmony: true)/' /app/config/environments/production.rb

# ruby init
RUN gem pristine rake && \
    gem install bundle && \
    gem update --system

# install dradis
RUN mkdir /data && \
    cd /app && \
        ruby bin/setup && \
        bundle exec rake assets:precompile

# clean image
RUN apt-get remove -y --purge \
        build-essential \
        gcc \
        libmariadb-dev \
        libsqlite3-dev \
        make \
        patch \
        wget \
        zlib1g-dev && \
    apt-get autoremove -y && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
    rm -f /data/development.sqlite3

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

WORKDIR /app

VOLUME /data

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
