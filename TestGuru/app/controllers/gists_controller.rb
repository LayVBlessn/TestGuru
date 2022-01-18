# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    find_test_passage

    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      gist_url = result.html_url
      Gist.create!(question: @test_passage.current_question, creator: current_user, url: gist_url)
      flash[:notice] = I18n.t('gist.notice', gist_url: gist_url).html_safe
    else
      flash[:alert] = I18n.t('gist.alert')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
