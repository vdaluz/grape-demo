module API
  module V1
    module Common
      extend ActiveSupport::Concern
        included do
          version 'v1'
          format :json

          rescue_from Mongoid::Errors::DocumentNotFound do |e|
            status 404

            present message: e.message
            present status: 404
          end

          rescue_from :all do |e|
            status 500

            present message: "Internal Server Error"
            present status: 500
          end

        end
    end
  end
end