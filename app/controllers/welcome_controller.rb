class WelcomeController < ApplicationController

  def index
  	 @user = current_user
     @area_id = @user.area_id
     if @area_id.present? == true 
       @user_area = Area.find(@area_id)
       @voivodeship_id = @user_area.voivodeship_id
       @user_voivodeship = Voivodeship.find(@voivodeship_id)
     end
  end
  
end