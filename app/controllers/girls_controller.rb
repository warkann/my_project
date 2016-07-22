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
      flash[:success] = 'Сохранено успешно'
      redirect_to girl_path(@girl.id)
    else
      flash[:error] = 'Ошибка'
      redirect_to edit_girl_path(@girl.id)
    end
  end

  private

  def girl_params
    params.require(:user).permit(:city, :height, :boobs_size, :body_type, :age, :phone, :area, :interests, :nickname, :sex)
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
end
