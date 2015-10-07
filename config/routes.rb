Rails.application.routes.draw do
  devise_for :teachers

  devise_scope :teacher do
    get "sign_up", to: "teachers#new_session"
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



  post 'teachers/upload' => 'teachers#upload'
  put 'teachers/:teacher_id/students/:student_id/detentions' => 'students#detentions'
  put 'teachers/:teacher_id/students/:student_id/add_to_classroom' => 'students#add_to_classroom'
  put 'teachers/:teacher_id/students/:student_id/remove_from_classroom' => 'students#remove_from_classroom'

  get 'teachers/not_admin' => 'teachers#not_admin'
  get 'teachers/not_authorized' => 'teachers#not_authorized'
  get 'students/already_assigned' => 'students#student_already_assigned'
  get 'students/all' => 'students#all'
  get 'teachers/:id/make_admin' => 'teachers#make_admin'


  get 'teachers/admin' => 'teachers#admin'

  root      'teachers#index'
  resources :teachers, only: [:index, :show, :edit, :update] do
    resources :students, only: [:index]
  end

  resources :students, only: [:show]


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
