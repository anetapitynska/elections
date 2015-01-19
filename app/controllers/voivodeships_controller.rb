class VoivodeshipsController < ApplicationController
	def index
		@voivodeships = Voivodeship.all.order('name DESC')
	end

	def new
	end

	def create
		@voivodeship = Voivodeship.new(voivodeship_params)
		@voivodeship.save

		redirect_to @voivodeship
	end

	def show
		@voivodeship = Voivodeship.find(params[:id])
	end

	private
		def voivodeship_params
			params.require(:voivodeship).permit(:name)
		end

end
