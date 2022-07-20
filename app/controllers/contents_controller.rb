class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    if @content.save
      redirect_to content_path(@content), notice: "レシピを投稿しました。"   
    else
      render :new
    end
  end

  def edit
    @content = Content.find(params[:id])
    if @content.user != current_user
        redirect_to contents_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.user_id = current_user.id
    if @content.save
      redirect_to content_path(@content), notice: "レシピを更新しました。"   
    else
      render :edit
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to contents_path
  end

  private
  def content_params 
    params.require(:content).permit(:title, :body, :image)
  end

end
