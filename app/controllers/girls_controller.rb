class GirlsController < ApplicationController
  before_action :find_girl, only: [:show, :edit, :update]
  before_action :check_rights, only: [:edit, :update]

  def index

  end

  def show
  end

  def edit
  end

  def update
    if @girl.update(girl_params)
      save_image if params[:user][:photos].present?

      flash[:success] = 'Сохранено успешно'
      redirect_to girl_path(@girl.id)
    else
      flash[:error] = 'Ошибка'
      redirect_to edit_girl_path(@girl.id)
    end
  end

  def ajax_remove_image
    Photo.where('user_id = ? and id = ?', params[:user_id], params[:photo_id]).first.destroy
    render json: { status: 200 }
    #TODO handle errors here
  end

  private

  def girl_params
    params.require(:user).permit(:city, :height, :boobs_size, :body_type, :age, :phone, :area, :interests, :nickname, :sex, {photos: []})
  end

  def find_girl
    @girl = User.find(params[:id])
  end

  def check_rights
    unless current_user.try(:id) == @girl.try(:id)
      flash[:error] = 'Неверный адрес'
      redirect_to root_path
    end
  end

  def save_image
    new_photo = Photo.new
    new_photo.image = params[:user][:photos]
    new_photo.user_id = @girl.id
    new_photo.save
  end
end
