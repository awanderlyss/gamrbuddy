# http://stackoverflow.com/questions/3546289/override-devise-registrations-controller

class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.profile = Profile.new
    respond_with self.resource
  end


end
