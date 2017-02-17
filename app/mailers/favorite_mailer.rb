class FavoriteMailer < ApplicationMailer
  default from: "dlively@resurgens.io"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, cc: "dlively@resurgens.io", subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = post.user
    @post = post

    mail(to: post.user.email, cc: "dlively@resurgens.io", subject: "Your post is live!")
  end
end
