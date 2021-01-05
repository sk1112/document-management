class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :search_document, only: [:index, :search]

  def index
    @documents = Document.includes(:user).order('created_at ASC')
    set_document_column
  end

  def search
    @results = @d.result.includes(:user)
    @documents = Document.includes(:user).order('created_at ASC')
    set_document_column
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
    params.require(:document).permit(:title, :jurisdiction_department, :category_id, :storage_location_id, :storage_period_id,
                                     :disposal_date)
          .merge(user_id: current_user.id)
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def search_document
    @d = Document.ransack(params[:q])
  end

  def set_document_column
    @document_title = Document.select('title').distinct
    @document_jurisdiction_department = Document.select('jurisdiction_department').distinct
    @document_disposal_date = Document.select('disposal_date').distinct
  end
end
