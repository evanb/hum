module Hum
  module Api
    class Index < Webmachine::Resource

      def content_types_provided
        [["application/hal+json",  :to_json]]
      end

      def allowed_methods
        ['GET']
      end

      def to_json
        {
          :_links => {
            :self => {
              :href => request.uri,
              :title => 'This index'
            }
          }
        }.to_json
      end

    end
  end
end