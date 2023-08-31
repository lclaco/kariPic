class PhotographsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @photographs = Photograph.with_attached_image.includes(:comments).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
    @photograph = Photograph.find(params[:id])
    @comments = @photograph.comments.order(created_at: :asc)
  end

  def new
    @photograph = current_user.photographs.build
  end

  def create
    @photograph = current_user.photographs.build(photograph_params)
    if current_user.email == 'karina@karipic.cl' && @photograph.save
      redirect_to photographs_path, notice: 'La fotografía se ha subido exitosamente.'
    else
      flash.now[:alert] = 'No tienes permisos para subir fotografías.' if current_user.email != 'karina@karipic.cl'
      render :new
    end
  end

  def edit
    @photograph = current_user.photographs.find(params[:id])
  end

  def update
    @photograph = current_user.photographs.find(params[:id])
    if @photograph.update(photograph_params)
      redirect_to @photograph, notice: 'Fotografía actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @photograph = current_user.photographs.find(params[:id])
    @photograph.destroy
    redirect_to photographs_path, notice: 'Fotografía eliminada correctamente.'
  end

  def like
    @photograph = Photograph.find(params[:id])
    @photograph.likes += 1
    @photograph.save
    redirect_to @photograph, notice: '¡Me gusta registrado!'
  end

  private

  def photograph_params
    params.require(:photograph).permit(:caption, :image_url,:feelings_situations)
  end
end
