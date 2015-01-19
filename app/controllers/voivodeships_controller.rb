class VoivodeshipsController < ApplicationController
	def index
		@voivodeships = Voivodeship.all.order('name ASC')
	end

	def new
		@voivodeship = Voivodeship.new
	end

	def create
		@voivodeship = Voivodeship.new(voivodeship_params)
		@voivodeship.save

		if @voivodeship.save
			redirect_to @voivodeship
		else
			render 'new'
		end
	end

	def show
		@voivodeship = Voivodeship.find(params[:id])
	end

	private
		def voivodeship_params
			params.require(:voivodeship).permit(:name)
		end

end
