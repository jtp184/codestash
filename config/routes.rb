Rails.application.routes.draw do
  resources :stash_elements


  get 'post/new_post'
  get 'post/create_post'
  get 'post/finish_post'
  get 'post/cancel_post'
  get 'post/add_item'
  get 'post/author'

  get 'post/view'

  get 'code_lookup/lookup'
  get 'code_lookup/show'

  post 'code_lookup/upload'

  root 'code_lookup#lookup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
