class VotesController < ApplicationController
 
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
        @vote = Vote.find(params[:id])

   # @sum = Vote.sum(:number)
  end

  #def sum
   # @votes = Vote.all

  #  @sum = Vote.sum('numberS')
 # end

def sum_voivodeship
  @voivodeship = Voivodeship.find(params[:id])
  @areas = Area.select('area_id').where('voivodeship_id')
  @vote = Vote.select('area_id, commitee_id, sum(number) as sum').group('area_id, commitee_id').order('sum DESC')
end

def sum
  @vote = Vote.select('area_id, commitee_id, sum(number) as sum').group('area_id, commitee_id').order('sum DESC')
end

#def sum_area
#  @vote = Vote.select('area_id, sum(number) as sum').group('area_id')
#end

#def sum_commitee
#   @vote = Vote.select('commitee_id, sum(number) as sum').group('commitee_id')
# end


  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
        @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
          @vote = Vote.find(params[:id])
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:number, :commitee_id, :area_id)
    end
end