class CommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to photographs_path, notice: 'Comentario agregado correctamente.'
    else
      redirect_to photograph, alert: 'Error al agregar el comentario.'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to @comment.photograph, notice: 'Comentario eliminado correctamente.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
