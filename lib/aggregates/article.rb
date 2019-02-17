require 'aggregate_root'

module Aggregates
  class Article
    include AggregateRoot

    AlreadyCreated = Class.new(StandardError)

    def initialize(id)
      @id = id
      @state = :draft
    end

    def create(author:, title:, content:)
      raise AlreadyCreated if @state == :created
      apply ArticleCreated.new(
        data: {
          article_id: @id, author: author, title: title, content: content
        }
      )
    end

    on ArticleCreated do |event|
      @author = event.data[:author]
      @title = event.data[:title]
      @content = event.data[:content]
      @state = :created
    end
  end
end
