class AreasController < ApplicationController
	
	def create
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.create(params[:area].permit(:name, :people))

		redirect_to voivodeship_path(@voivodeship)
	end

	def destroy
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		@area.destroy

		redirect_to voivodeship_path(@voivodeship)
	end


	def edit
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
	end

	def update
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		if @area.update(params[:areas].permit(:name).permit(:people))
			redirect_to @area
		else
			render 'edit'
		end
	end




end
