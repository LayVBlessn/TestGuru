# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  resources :tests, only: %i[index show] do
    resources :questions, except: :index, shallow: true do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers
      end
    end
    resources :gists, only: :index
  end
end
