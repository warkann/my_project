class GirlsController < ApplicationController

  def index

  end

  def show
    @girl = User.find(params[:id])
  end

  def edit
    @girl = User.find(params[:id])
  end

  def update
    girl = User.find(params[:id])

    if girl.update(girl_params)
      flash[:succes] = 'Сохранено успешно'
      redirect_to(girl_path(girl.id))
    else
      flash[:error] = 'Ошибка'
    end
  end

  private

  def girl_params
    params.require(:user).permit(:city, :height, :boobs_size, :body_type, :age, :phone, :area, :interests)
  end
end
