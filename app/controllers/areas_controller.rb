class AreasController < ApplicationController
	
    before_filter :authenticate_user!	
    load_and_authorize_resource
	def new
		@area = Area.new
	end


	def create
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.create(params[:area].permit(:name, :people, :number, :empty_votes, :incorrect_votes))

		redirect_to voivodeship_path(@voivodeship)
	end

	def destroy
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		@area.destroy

		redirect_to voivodeship_path(@voivodeship)
	end

	def show
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])

	end


	def edit
		@user = User.find params[:id]
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
	#	redirect_to root_path, notice: 'Thou Shalt Nought duuu dat :(' unless @user.area_id == @area
	end

	def update
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		if @area.update(params[:area].permit(:name, :people, :number,  :empty_votes, :incorrect_votes))
			redirect_to @voivodeship
		else
			render 'edit'
		end
	end

private
		def area_params
			params.require(:area).permit(:name, :people, :number, :empty_votes, :incorrect_votes)
		end



end
