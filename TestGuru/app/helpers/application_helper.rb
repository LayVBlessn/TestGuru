# frozen_string_literal: true

module ApplicationHelper

  def year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'GitHub', 
            "https://github.com/#{author}/#{repo}", 
            target: '_blank'
  end
end
