class Article
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :published_on, type: Date
end
