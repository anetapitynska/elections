class AreasController < ApplicationController
	
    before_filter :authenticate_user!	
    load_and_authorize_resource
	def new
		@area = Area.new
	end


	def create
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.create(params[:area].permit(:name, :people, :number, :empty_votes, :incorrect_votes, :ballots))

		redirect_to voivodeship_path(@voivodeship)
	end

	def destroy
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		
		Vote.delete_all(area_id = @area.id)  #delete all votes in this area
		@area.destroy

		redirect_to voivodeship_path(@voivodeship)
	end

	def show
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])

		@votess = Vote.where(area_id: @area.id).group('commitee_id').sum(:number)

		if @voivodeship.commitees.length == 0
   			 @assosciated_commitees = "None"
 		 else
    	@assosciated_commitees = @voivodeship.commitees.map(&:name).join(", ")
        end


	end


	def edit
	#	@user = User.find(params[:id])
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
	end

	def update
		@voivodeship = Voivodeship.find(params[:voivodeship_id])
		@area = @voivodeship.areas.find(params[:id])
		if @area.update(params[:area].permit(:name, :people, :number,  :empty_votes, :incorrect_votes, :ballots))
			redirect_to @voivodeship
		else
			render 'edit'
		end
	end

private
		def area_params
			params.require(:area).permit(:name, :people, :number, :empty_votes, :incorrect_votes, :ballots)
		end



end
