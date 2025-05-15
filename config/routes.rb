Rails.application.routes.draw do

   devise_for :users
   
   root to: "items#index"

   resources :items, only: [:new , :create , :show , :edit , :update ,:destroy] do
       resources :bought_items , only: [:index , :create ] 
   
   end

   
end



