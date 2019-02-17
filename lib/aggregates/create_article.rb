module Aggregates
  class CreateArticle < Command
    attribute :article_id, Types::UUID
    attribute :author, Types::Strict::String
    attribute :content, Types::Strict::String
    attribute :title, Types::Strict::String

    alias :aggregate_id :article_id
  end
end
