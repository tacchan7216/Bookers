Rails.application.routes.draw do
  get 'books/new'
  get 'books' => 'books#create'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get '/top' => 'homes#top'
 resources :books

end
