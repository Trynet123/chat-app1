class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    # binding.pry
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    # Room.find(params[:id])を使用して、削除したいチャットルームの情報を取得
    # Roomのどの部屋ですか？と聞いて、答えをroomに入れている。
    room.destroy
    redirect_to root_path
    # root（roomsのindex）にリダイレクト

    # @room.destroy
    # 削除するだけなのでビューの表示は必要はありません。
  end

  # バリューが配列で送られてきているため、配列の保存を許可するためのストロングパラメーターが必要
  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
    # 配列に対して保存を許可したい場合は、キーに対し[]を値として記述
  end
end
