class PostsController < ApplicationController
  def index
    @posts = Post.all
    index = 0
    @posts.each do |spamNotice|
      if index % 5 == 0
        spamNotice.title = "SPAM"
      end
      index += 1
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
