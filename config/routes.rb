Rails.application.routes.draw do
  scope :api do
    post 'employee_details/create', to: 'employee_details#create'

    get 'employee_details/:id/fetch_details', to: 'employee_details#fetch_details'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
