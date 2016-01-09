class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_prarams)
    if @message.save
      redirect_to root_path , notice: 'Your message is savied.'
    else
      @messages = Message.all
      flash.now[:alert] = "Your massage failed to save."
      render 'index'
    end
  end
  
  private
  def message_prarams
    params.require(:message).permit(:name, :body)
  end
end
