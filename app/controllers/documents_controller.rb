class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
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
  end

  def update
    if @document.update(document_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to root_path
  end

  private
  
  def document_params
    params.require(:document).permit(:title, :category_id, :storage_location, :storage_period_id, :disposal_date, :jurisdiction_department)
          .merge(user_id: current_user.id)
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
