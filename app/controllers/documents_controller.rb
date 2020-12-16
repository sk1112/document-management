class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.includes(:user).order('created_at DESC')
    @search_params = document_search_params
    @documents = Document.search(@search_params).joins(:user)
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def search
    @search_params = document_search_params
    @documents = Document.search(@search_params).joins(:user)
  end

  def edit
    redirect_to action: :index unless current_user.id == @document.user.id
  end

  def update
    if @document.update(document_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to action: :show unless current_user.id == @document.user.id
    @document.destroy
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :jurisdiction_department, :category_id, :storage_location, :storage_period_id, :disposal_date)
          .merge(user_id: current_user.id)
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def document_search_params
    params.fetch(:search, {}).permit(:title, :jurisdiction_department, :disposal_date_from, :disposal_date_to, :storage_location)
  end
end
