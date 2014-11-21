module API
  module V1
    module Common
      extend ActiveSupport::Concern
        included do
          version 'v1'
          format :json

          rescue_from Mongoid::Errors::DocumentNotFound do |e|
            error_response(message: e.message, status: 404)
          end

          rescue_from :all do |e|
           error_response(message: "Internal Server Error", status: 500)
          end

        end
    end
  end
end