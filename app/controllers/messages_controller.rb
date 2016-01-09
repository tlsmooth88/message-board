class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'Your message is saved.'
    else
      @messages = Message.all
      flash.now[:alert] = "Your massage failed to save."
      render 'index'
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      redirect_to root_path , notice: 'Message updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'Message deleted.'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, 
    #:age,
    :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
