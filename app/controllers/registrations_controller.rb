# http://stackoverflow.com/questions/3546289/override-devise-registrations-controller

class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource({})
    #self.resource.build_profile
    #self.resource.profile = Profile.new
    respond_with self.resource
  end

  def create

    build_resource(sign_up_params)

    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def edit
    super
  end

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
