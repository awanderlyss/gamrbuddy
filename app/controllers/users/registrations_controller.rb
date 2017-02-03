# http://stackoverflow.com/questions/17767449/rails-4-0-with-devise-nested-attributes-unpermited-parameters
class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /users/sign_up
  def new
    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u|
        u.permit(:email, :password, :password_confirmation, :profile_attributes => [:gamertag, :img_url, :desc] )
      }
    end
end
