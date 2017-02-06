# http://stackoverflow.com/questions/3546289/override-devise-registrations-controller

class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters, if: :devise_controller?


  private

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u|
          u.permit(:email, :password, :password_confirmation, profile_attributes: [:gamertag, :img_url, :desc])
       }
       devise_parameter_sanitizer.permit(:account_update) { |u|
          u.permit(:email, :password, :password_confirmation, :current_password, profile_attributes: [:gamertag, :img_url, :desc])
       }
    end

end
