class CommiteesController < ApplicationController
	
  before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@commitees = Commitee.all.order('name ASC')
	end

	def new
		@commitee = Commitee.new
	end

	def create
		@commitee = Commitee.new(commitee_params)
		@commitee.save

		if @commitee.save
			redirect_to @commitee
		else
			render 'new'
		end
	end

	def show
		@commitee = Commitee.find(params[:id])
	  
		@com_votes = Vote.select('area_id, commitee_id, number').joins(:area).where(commitee_id: @commitee.id).group(:name).sum(:number)
	#	@com_votes = Vote.select('area_id, commitee_id, number').joins(:voivodeship).where(area_ids: 'area_id').group(:name).sum(:number)
		#@com_votes = @co_votes.joins(:voivodeships).group(:name)


	  if @commitee.voivodeships.length == 0
	    @assosciated_voivodeships = "None"
	  else
	    @assosciated_voivodeships = @commitee.voivodeships.map(&:name).join(", ")
	  end
	end

	def edit
		@commitee = Commitee.find(params[:id])
	end

	def update
		@commitee = Commitee.find(params[:id])
		if @commitee.update(params[:commitee].permit(:name, :image, {:voivodeship_ids => []}))
			redirect_to @commitee
		else
			render 'edit'
		end
	end

	def destroy
		@commitee = Commitee.find(params[:id])
	
		@commitee.destroy
		redirect_to commitees_path
	end

	private
		def commitee_params
			params.require(:commitee).permit(:name, :image, {:voivodeship_ids => []})
		end
end
