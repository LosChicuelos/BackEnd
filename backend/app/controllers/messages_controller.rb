class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.paginatedef(params[:page])
    render json: @messages
  end
  
  def belongsuser
    if params[:sender_id] != nil
      #puts 'sender_id';
      #puts params[:sender_id];
      @messages = Message.messages_sent_by_user2(params[:sender_id]);
    else 
      #puts 'user_id';
      #puts params[:user_id];
      @messages = Message.messages_received_by_user2(params[:user_id]);
    end
    #puts 'Hola'
    #@messages.each { |x| puts x.sendertemp.inspect }
    #puts @messages.to_json(:methods => %w(sendertemp))
    render json: @messages.to_json(:methods => %w(sendertemp receivertemp))
  end

def show
    @message = message.find(params[:id])
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

      if @message.save
      render json: @message, status: :created, location: @message
      else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @message.update(message_params)
      render json: @message
      else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clasification
      @message = Classification.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:topic, :content, :date, :sender_id, :receiver_id)
    end
end
