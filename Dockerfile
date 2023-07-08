FROM ruby:3.2.2

RUN mkdir /cmd
COPY cmd/subscribe.rb /src

RUN gem install mqtt

CMD ["ruby", "/cmd/subscribe.rb"]