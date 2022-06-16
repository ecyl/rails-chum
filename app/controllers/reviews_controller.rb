class ReviewsController < ApplicationController

  def new
    @review = authorize Review.new
  end

  def create
  end
end
