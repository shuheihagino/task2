Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :users
  resources :attendances
  root 'attendance#start'
  
  get  'attendance/start'
  get  'attendance/finish'
  get  'attendance/index'  
  get  'attendance/attendance'  
  get  'attendance/leave' 
  
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
