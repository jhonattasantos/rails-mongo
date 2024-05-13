class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:pdf_document].present?
      # Lê os dados binários do arquivo enviado
      pdf_data = params[:user][:pdf_document].read
      # Define os dados binários do PDF no modelo User
      @user.pdf_document = BSON::Binary.new(pdf_data, :generic)
    end

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def download_pdf_document
    @user = User.find(params[:id])
    send_data @user.pdf_document.data, filename: 'document.pdf', type: 'application/pdf', disposition: 'attachment'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :pdf_document)
  end
end
