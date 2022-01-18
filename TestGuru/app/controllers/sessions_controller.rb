# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.first_name}"
  end

  protected

  def after_sign_in_path_for(_resource)
    return admin_tests_path if current_user.is_a?(Admin)

    root_path
  end
end
