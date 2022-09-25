Rails.application.routes.draw do
  root 'home#index'

  get '*path', to: 'home#index', constraints: lambda { |request|
    !request.xhr? && request.format.html?
  }

  namespace :api do
    namespace :v1 do
      resources :launches, only: [] do
        collection do
          get :next
          get :latest
          get :upcoming
          get :past
        end
      end
    end
  end
end
