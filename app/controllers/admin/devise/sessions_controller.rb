class Admin::Devise::SessionsController < Devise::SessionsController
  # def new
  # end

  # def create
  # end

  # def destroy
  # end

 def after_sign_in_path_for(resource)
    admin_path
 end
end
