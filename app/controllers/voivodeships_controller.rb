class VoivodeshipsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@voivodeships = Voivodeship.all.order('name ASC')
	end

	def new
		@voivodeship = Voivodeship.new
	end

	def sum
		@voivodeship = Voivodeship.find(params[:id]) 
  		@areas = Area.where(id_voivodeship == @voivodeship.id)
  		@suma = Vote.where(area_id == @areas).sum(:number)
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
		@correct = Vote.select('area_id, commitee_id, number').joins(:commitee).where(area_id: @voivodeship.areas).group(:name)
	


  		@sum_correct = Vote.select('area_id, commitee_id, number').where(area_id: @voivodeship.areas).sum(:number)
  		@sum_incorrect = Area.select('id, incorrect_votes').where(id: @voivodeship.areas).sum(:incorrect_votes)
  		@sum_empty = Area.select('id, empty_votes').where(id: @voivodeship.areas).sum(:empty_votes)
  		@sum_all = @sum_correct.to_i + @sum_incorrect.to_i + @sum_empty.to_i
  		@sum_ballots = Area.select('id, ballots').where(id: @voivodeship.areas).sum(:ballots)
		@sum_people = Area.select('id, people').where(id: @voivodeship.areas).sum(:people)
		@vote = Vote.select('area_id, commitee_id, sum(number) as sum').where(area_id: @voivodeship.areas).group('commitee_id').order('sum DESC')
		
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
		if @voivodeship.update(params[:voivodeship].permit(:name, :seats, :image))
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
			params.require(:voivodeship).permit(:name, :seats, :image)
		end

end
