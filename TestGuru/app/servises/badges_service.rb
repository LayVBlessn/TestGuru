class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def assign_badge
    Badge.all.each do |badge|
      @user.badges << badge if challenge_completed?(badge)
    end
  end

  private

  def tests_with_first_try_challenge_completed?
    TestPassage.where(user: @user,
                      test: Test.where(title: @challenge),
                      test_passed: true).count == 1
  end

  def tests_by_category_challenge_completed?
    number_of_listed_tests = Test.where(category: Category.where(body: @challenge)).count
    return if number_of_listed_tests.zero?

    number_of_listed_tests == TestPassage.where(user: @user,
                                                test: Category.where(body: @challenge),
                                                test_passed: true).uniq{ |t| t.test_id }.count
  end

  def tests_by_level_challenge_completed?
    challenge = @challenge.to_i
    number_of_listed_tests = Test.where(level: challenge).count
    return if number_of_listed_tests.zero?

    number_of_listed_tests == TestPassage.where(user: @user,
                                                test: Test.where(level: challenge),
                                                test_passed: true).uniq{ |t| t.test_id }.count
  end

  def challenge_completed?(badge)
    @challenge = badge.challenge
    case badge.rule
    when 'tests_by_level'
      tests_by_level_challenge_completed?
    when 'tests_by_category'
      tests_by_category_challenge_completed?
    else
      tests_with_first_try_challenge_completed?
    end
  end
end
