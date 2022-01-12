# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy update edit]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question.test, notice: 'Question was updated'
    else
      render :new, notice: 'Try again'
    end
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question.test, notice: 'New question was created'
    else
      render :new, notice: 'Try again'
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test, notice: 'Question was deleted'
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def rescue_with_question_not_found
    render html: '<center>Question was not found</center>'.html_safe
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
