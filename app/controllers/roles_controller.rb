
class RolesController < InheritedResources::Base
load_and_authorize_resource

before_filter :authenticate_user!
  
def show
  if @role.users.length == 0
    @assosciated_users = "None"
  else
    @assosciated_users = @role.users.map(&:name).join(", ")
  end
end

  private

    def role_params
      params.require(:role).permit(:name, :description)
    end
end

