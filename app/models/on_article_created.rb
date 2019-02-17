class OnArticleCreated
  def call(event)
    uid = event.data[:article_id]

    return if Article.where(uid: uid).exists?

    Article.create!(
      uid: uid,
      title: event.data[:title],
      content: event.data[:content],
      author: event.data[:author]
    )
  end
end
