Rails.application.routes.draw do
  post 'users',to: 'users#create'
  delete 'users/:id',to: 'users#destroy'
  put 'users/:id',to: 'users#update'
  get 'users/:id',to: 'users#show'

  post 'events',to: 'events#create'
  delete 'events/:id',to: 'events#destroy'
  put 'events/:id',to: 'events#update'
  get 'events/:id',to: 'events#show'

  post 'event_venues',to: 'event_venues#create'
  delete 'event_venues/:id',to: 'event_venues#destroy'
  put 'event_venues/:id',to: 'event_venues#update'
  get 'event_venues/:id',to: 'event_venues#show'

  post 'tickets',to: 'tickets#create'
  delete 'tickets/:id',to: 'tickets#destroy'
  put 'tickets/:id',to: 'tickets#update'
  get 'tickets/:id',to: 'tickets#show'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
