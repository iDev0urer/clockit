Rails.application.routes.draw do
  
  root to: 'home#index'

  # Authentication for admins
  devise_for :admin, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :admin do
    # session handling
    get     '/login'  => 'devise/sessions#new',     as: 'new_admin_session'
    post    '/login'  => 'devise/sessions#create',  as: 'admin_session'
    delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_admin_session'

    # joining
    get   '/join' => 'devise/registrations#new',    as: 'new_admin_registration'
    post  '/join' => 'devise/registrations#create', as: 'admin_registration'

    scope '/account' do
      # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_admin_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'admin_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_admin_password'

      # confirmation
      get   '/confirm'        => 'devise/confirmations#show',   as: 'admin_confirmation'
      post  '/confirm'        => 'devise/confirmations#create'
      get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_admin_confirmation'

      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_admin_registration'
      get '/settings' => 'devise/registrations#edit',   as: 'edit_admin_registration'
      put '/settings' => 'devise/registrations#update'

      # account deletion
      delete '' => 'devise/registrations#destroy'
    end
  end


  # Authentication for users
  devise_for :user, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    # session handling
    get     '/clock/login'  => 'devise/sessions#new',     as: 'new_user_session'
    post    '/clock/login'  => 'devise/sessions#create',  as: 'user_session'
    delete  '/clock/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'

    # joining
    get   '/dashboard/add_user' => 'devise/registrations#new',    as: 'new_user_registration'
    post  '/dashboard/add_user' => 'devise/registrations#create', as: 'user_registration'

    scope '/account' do
      # password reset
      get   '/dashboard/users/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
      put   '/dashboard/users/reset-password'        => 'devise/passwords#update', as: 'user_password'
      post  '/dashboard/users/reset-password'        => 'devise/passwords#create'
      get   '/dashboard/users/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'

      # confirmation
      get   '/clock/confirm'        => 'devise/confirmations#show',   as: 'user_confirmation'
      post  '/clock/confirm'        => 'devise/confirmations#create'
      get   '/clock/confirm/resend' => 'devise/confirmations#new',    as: 'new_user_confirmation'

      # settings & cancellation
      get '/dashboard/users/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
      get '/dashboard/users/edit' => 'devise/registrations#edit',   as: 'edit_user_registration'
      put '/dashboard/users/edit' => 'devise/registrations#update'

      # account deletion
      delete '' => 'devise/registrations#destroy'
    end
  end

end
