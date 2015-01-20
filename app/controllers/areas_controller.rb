class AreasController < ApplicationController
	def create
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.area.create(params[:area].permit(:name, :people))

		redirect_to voivodeship_path(@voivodeship)
	end
end
