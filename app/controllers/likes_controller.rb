class LikesController < ApplicationController
  before_action :guard_likes

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)
    @like.user = current_user

    respond_to do |format|
      if @like.save
        format.html{ redirect_to @like.likable }
        format.json{ render :show, status: :created, location: @like }
      else
        format.html{ redirect_to @like.likable, notice: @like.errors.messages.values.flatten.join(', ') }
        format.json{ render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(like_params[:id])

    @like.destroy
    respond_to do |format|
      format.html{ redirect_to @like.likable }
      format.json{ head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.permit(:id, :likable_id, :likable_type, :user_id)
  end

  def guard_likes
    unless user_signed_in?
      redirect_to new_user_session_path, flash: { warning: 'Sign in to show your support!' }
    end
  end
end
