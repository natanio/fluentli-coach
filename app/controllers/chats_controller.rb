class ChatsController < ApplicationController
  before_action :authenticate_user!

  # GET /hangouts
  # GET /hangouts.json
  def index
      @chats = Chat.all
  end

  # GET /hangouts/1
  # GET /hangouts/1.json
  def show
    @chat = Chat.find(params[:id])
    @chat_messages = @chat.chat_messages.order('created_at ASC')
  end

  # GET /hangouts/new
  def new
    @chat = Chat.new
  end

  # POST /hangouts
  # POST /hangouts.json
  def create
    @chat = Hangout.new(chat_params)
    @chat.save

    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_path(@chat), notice: 'Chat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chat }
      else
        format.html { render action: 'new' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangouts/1
  # PATCH/PUT /hangouts/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_path(@chat), notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangouts/1
  # DELETE /hangouts/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangout_params
      params.require(:chat).permit(:learner_id, :coach_id)
    end
end