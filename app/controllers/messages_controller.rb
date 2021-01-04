class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # チャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出し
    # その値を@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存
    if @message.save
    # 投稿したメッセージをDBに保存

    # messagesコントローラーのindexアクションに再度リクエストを送信し、新たにインスタンス変数を生成
    # これによって保存後の情報に更新
      redirect_to room_messages_path(@room)
      # redirect_to 'message/index'
      
    else
      # indexアクションのindex.html.erbを表示
      render :index

      # render 
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可


  # def new
    
  # end

  # def create
  #   message.create(message_params)
  # end

  # private
  # def message_params
  #   params.require(:message).permit(:content, params[:room_id])
  # end
end



# 見本
# class MessagesController < ApplicationController
#   def index
#     @message = Message.new
#     @room = Room.find(params[:room_id])
#   end

#   def create
#     @room = Room.find(params[:room_id])
#     @message = @room.messages.new(message_params)
#     @message.save
#   end

#   private

#   def message_params
#     params.require(:message).permit(:content).merge(user_id: current_user.id)
#   end
# end




