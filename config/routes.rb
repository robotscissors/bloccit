Rails.application.routes.draw do
  get 'questions/new'

  get 'questions/create'

  get 'questions/edit'

  get 'questions/update'

  get 'questions/destroy'

  get 'questions/show'

  resources :questions
  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
