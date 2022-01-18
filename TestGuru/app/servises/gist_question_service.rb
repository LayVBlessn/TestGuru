class GistQuestionService

  GistResponse = Struct.new(:success?, :html_url)

  def initialize(question, client: git_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    GistResponse.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('gist.about', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def git_client
    Octokit::Client.new(access_token: Rails.application.credentials.gist_token)
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end
end
