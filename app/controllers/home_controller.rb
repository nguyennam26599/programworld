# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @posts = Post.all
    @user = User.find_by(id: params[:id])
  end

  def index
    @pagy_daily, @posts_daily = pagy(Post.all.where(status: 'pending').order(created_at: :desc).order(view_count: :desc))
  end

  def posts_weekly
    @pagy_weekly, @posts_weekly = pagy(Post.all.where(status: 'pending').this_week.order(view_count: :desc))
  end

  def posts_monthly
    @pagy_monthly, @posts_monthly = pagy(Post.all.where(status: 'pending').this_month.order(view_count: :desc))
  end

  def tagfeed
    @pagy, @posts = pagy(Post.all, page: params[:page])
  end
end
