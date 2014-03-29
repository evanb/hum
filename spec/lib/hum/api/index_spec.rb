require 'spec_helper'
require 'rack/test'

require 'hum/api'
require 'json'

module Hum
  module Api
    describe Index do

      include Rack::Test::Methods

      def app
        Hum::Api::API
      end

      describe "get" do
        context "when successful" do

          let(:body_hash) { JSON.parse(last_response.body, symbolize_names: true)}

          before do
            get("/api")
          end

          it "returns application/hal+json" do
            expect(last_response.content_type).to eq "application/hal+json"
          end

          it "returns a link for itself" do
            expect(body_hash[:_links][:self][:href]).not_to be_nil
          end

        end
      end
    end
  end
end
