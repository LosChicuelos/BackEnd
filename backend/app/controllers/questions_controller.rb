class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.paginatedef(params[:page])

    render json: @questions
  end

  def show
    @question = question.find(params[:id])
  end

  # POST /articles
  def create
    @question = Question.new(question_params)

      if @question.save
        
      #Con la siguiente linea se envia un correo al vendedor, por cada nueva pregunta.
      NewQuestionMailer.notify(@question).deliver_now
      
      render json: @question, status: :created, location: @question
      else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @question.update(question_params)
      render json: @question
      else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:question, :answer, :date, :user_id, :article_id)
    end
end
