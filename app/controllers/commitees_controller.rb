class CommiteesController < ApplicationController
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
	end

	def edit
		@commitee = Commitee.find(params[:id])
	end

	def update
		@commitee = Commitee.find(params[:id])
		if @commitee.update(params[:commitee].permit(:name))
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
			params.require(:commitee).permit(:name)
		end
end
