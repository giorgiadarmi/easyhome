class Users::RegistrationsController < Devise::RegistrationsController
    after_action :assign_role, only:[:create]

   

 
 end
 