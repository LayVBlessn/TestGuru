# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, title)
    link_to title,
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end

  def flash_message
    content_tag :p, flash[:alert], class: 'flash alert' unless flash.empty?
  end
end
