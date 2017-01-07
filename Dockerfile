FROM hypriot/rpi-ruby

# detect best mirror
RUN echo deb http://mirror.inode.at/raspbian/raspbian/ jessie main contrib non-free rpi > /etc/apt/sources.list

# this forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup


RUN apt-get update
RUN apt-get -y install build-essential libsdl1.2-dev vim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --deployment

COPY . /usr/src/app

CMD ["bundle", "exec", "ruby", "app.rb"]

