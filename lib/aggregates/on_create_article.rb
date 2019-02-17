module Aggregates
  class OnCreateArticle
    include CommandHandler

    def call(command)
      with_aggregate(Article, command.aggregate_id) do |article|
        article.create(
          author: command.author,
          title: command.title,
          content: command.content
        )
      end
    end

  end
end
