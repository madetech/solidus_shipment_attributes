FROM madetech/rails-deps

RUN mkdir -p /app
WORKDIR /app
COPY lib/solidus_shipment_attributes/version.rb ./lib/solidus_shipment_attributes/version.rb
COPY Gemfile Gemfile.lock solidus_shipment_attributes.gemspec ./
RUN bundle install --jobs 20 --retry 5
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
