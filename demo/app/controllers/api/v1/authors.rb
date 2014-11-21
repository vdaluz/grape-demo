module API
  module V1
    class Authors < Grape::API
      include API::V1::Common   

      resource :authors do
        
        desc "Return the list of authors"
    
        get do
          authors = Author.all
          present :total, authors.length
          present :authors, authors
        end

        desc "Return an author by id."
        params do
          requires :id, type: String, desc: "Author id."
        end
        get ':id' do
          Author.find(params[:id])
        end

        desc "Create an author."
        params do
          requires :name, type: String, desc: "Author name."
        end
        post do
          Author.create!({
            name: params[:name]
          })
        end

        desc "Update an author."
        params do
          requires :id, type: String, desc: "Author id."
          requires :name, type: String, desc: "Author name."
        end
        put ':id' do
          Author.find(params[:id]).update({
            name: params[:name]
          })
        end

        desc "Delete an author."
        params do
          requires :id, type: String, desc: "Author id."
        end
        delete ':id' do
          Author.find(params[:id]).destroy
        end

      end

    end
  end
end