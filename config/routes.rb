# plugins/custom_buttons/config/routes.rb
RedmineApp::Application.routes.draw do
  resources :custom_buttons, only: [:index] do
    collection do
      post :update
    end
  end
end
