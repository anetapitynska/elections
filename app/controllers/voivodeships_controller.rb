class VoivodeshipsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

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
		@vote = Vote.select('area_id, commitee_id, sum(number) as sum').group('area_id, commitee_id').order('sum DESC')

  	if @voivodeship.commitees.length == 0
  		@assosciated_commitees = "None"
 	  else
    	@assosciated_commitees = @voivodeship.commitees.map(&:name).join(", ")
  	end
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
	  Area.delete_all(voivodeship_id = @voivodeship.id)  #delete all areas in this voivodeships
		@voivodeship.destroy
		redirect_to voivodeships_path
	end

	private
		def voivodeship_params
			params.require(:voivodeship).permit(:name, :seats)
		end

end
