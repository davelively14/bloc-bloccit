module UsersHelper
  def has_posts?(user)
    user.posts.count > 0 ? true : false
  end

  def has_comments?(user)
    user.comments.count > 0 ? true : false
  end

  def has_favorites?(user)
    user.favorites.count > 0 ? true : false
  end
end
