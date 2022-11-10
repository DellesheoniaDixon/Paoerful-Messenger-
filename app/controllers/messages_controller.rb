class MessagesController < ApplicationController

    def create
      @current_user = current_user
      @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id], image: params[:image])
      @message.image.attach(params[:message][:image])
    end

    def index
      @messageswithimage = Message.all.with_attached_images
    end
  
    def show
      @message = Message.find(params[:id])
      @messageimage = @message.image
    end
  
    private
  
    def msg_params
      params.require(:message).permit(:content, :image)
    end
    
  end