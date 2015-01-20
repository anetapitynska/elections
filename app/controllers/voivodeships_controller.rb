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

	def edit
		@voivodeship = Voivodeship.find(params[:id])
	end

	def update
		@voivodeship = Voivodeship.find(params[:id])
		if @voivodeship.update(params[:voivodeship].permit(:name, :seats))
			redirect_to @voivodeship
		else
			render 'edit'
		end
	end

	def destroy
		@voivodeship = Voivodeship.find(params[:id])
		@voivodeship.destroy

		redirect_to voivodeships_path
	end

	private
		def voivodeship_params
			params.require(:voivodeship).permit(:name, :seats)
		end

end
