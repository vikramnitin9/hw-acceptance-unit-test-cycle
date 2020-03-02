Rottenpotatoes::Application.routes.draw do
  get 'movies/:id/search_directors', to: 'movies#search_directors', as: :search_directors

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
