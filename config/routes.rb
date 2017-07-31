Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'book/list'
  get 'book/new'
  post 'book/create'
  patch 'book/update'
  get 'book/list'
  get 'book/show'
  get 'book/edit'
  get 'book/delete'
  get 'book/update'
  get 'book/show_subjects'
end
