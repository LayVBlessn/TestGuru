# frozen_string_literal: true

class GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end

