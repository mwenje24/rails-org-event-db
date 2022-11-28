Rails.application.routes.draw do
  resources :event_attendees
  resources :attendees
  resources :organizers
  resources :event_categories
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/attendee_login", to: "sessions#createAttendee"
  post "/organizer_login", to: "sessions#createOrganizer"

  delete "/attendee_logout", to: "sessions#destroyAttendee"
  delete "/organizer_logout", to: "sessions#destroyOrganizer"

end
