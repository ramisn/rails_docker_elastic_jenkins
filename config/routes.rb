Rails.application.routes.draw do
  namespace :api do
    resource :ping, only: :show
  end
end
