module API
  module V1
    class Articles < Grape::API
      include API::V1::Common   

      resource :articles do
        
        desc "Return the list of articles"
    
        get do
          articles = Article.all
          present :total, articles.length
          present :articles, articles
        end

        desc "Return an article by id."
        params do
          requires :id, type: String, desc: "Article id."
        end
        get ':id' do
          Article.find(params[:id])
        end

        desc "Create an article."
        params do
          requires :title, type: String, desc: "Article title."
          requires :content, type: String, desc: "Article content."
          optional :tags, type: String, desc: "Article tags (comma separated"
        end
        post do
          Article.create!({
            title: params[:title],
            content: params[:content],
            tags: params[:tags]
          })
        end

        desc "Update an article."
        params do
          requires :id, type: String, desc: "Article id."
          requires :title, type: String, desc: "Article title."
          requires :content, type: String, desc: "Article content."
        end
        put ':id' do
          Article.find(params[:id]).update({
            title: params[:title],
            content: params[:content]
          })
        end

        desc "Delete an article."
        params do
          requires :id, type: String, desc: "Article id."
        end
        delete ':id' do
          Article.find(params[:id]).destroy
        end

      end

    end
  end
end