FROM ruby:buster as builder

ENV WORKDIR=/workspace
WORKDIR ${WORKDIR}

COPY Rakefile $WORKDIR/Rakefile
COPY Gemfile $WORKDIR/Gemfile
COPY Gemfile.lock $WORKDIR/Gemfile.lock
COPY threadfix-cli.gemspec $WORKDIR/threadfix-cli.gemspec
COPY lib $WORKDIR/lib
COPY bin $WORKDIR/bin

RUN bundle install

# Install to /$WORKDIR/pkg/*.gem
RUN bundle exec rake install

FROM ruby:3.1.0-buster
COPY --from=builder /workspace/pkg/*.gem ./threadfix-cli.gem
RUN gem install threadfix-cli.gem
WORKDIR /workspace
VOLUME ./workspace
ENTRYPOINT threadfix applications
