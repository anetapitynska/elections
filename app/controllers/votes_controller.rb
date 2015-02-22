class VotesController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
   # @sum = Vote.sum(:number)
  end

  def sum_voivodeships
    @vote = Vote.select('area_id, commitee_id, number').order('number DESC')
   
    

    @voivodeships = Voivodeship.all.order('name ASC')


  end

  def sum
    @vote = Vote.select('area_id, commitee_id, sum(number) as sum').group('commitee_id').order('sum DESC')
    @voivodeships = Voivodeship.all.order('name ASC')

  end

  #def sum_area
  #  @vote = Vote.select('area_id, sum(number) as sum').group('area_id')
  #end

  #def sum_commitee
  #   @vote = Vote.select('commitee_id, sum(number) as sum').group('commitee_id')
  # end

  def new
    @vote = Vote.new
    @user = current_user
    @area_id = @user.area_id
    if @area_id.present? == true 
        @user_area = Area.find(@area_id)
        @voivodeship_id = @user_area.voivodeship_id
        @user_voivodeship = Voivodeship.find(@voivodeship_id)
        @com = Commitee.where(voivodeship_id: @user_voivodeship.id)
        if @user_voivodeship.commitees.length == 0
          @assosciated_commitees = "None"
        else
          @assosciated_commitees = @user_voivodeship.commitees.map(&:id)
        end
    end
  end

  def edit
    @user = current_user
    @area_id = @user.area_id
    if @area_id.present? == true 
        @user_area = Area.find(@area_id)
        @voivodeship_id = @user_area.voivodeship_id
        @user_voivodeship = Voivodeship.find(@voivodeship_id)
        @com = Commitee.where(voivodeship_id: @user_voivodeship.id)
        if @user_voivodeship.commitees.length == 0
          @assosciated_commitees = "None"
        else
          @assosciated_commitees = @user_voivodeship.commitees.map(&:id)
        end
    end

    @vote = Vote.find(params[:id])
  end

  def create
    @vote = Vote.new(vote_params)
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Głosy zostały dodane.' }
        format.json { render :show, status: :created, location: @vote }
      else
        @area_id = current_user.area_id
        @area = Area.find(@area_id)
        @voivodeship_id = @area.voivodeship_id
        format.html { redirect_to voivodeship_area_url(@voivodeship_id, @area_id) , notice: 'Edytuj już istniejące głosy dla tego komitetu w danym okręgu.'}
       # format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    @user = current_user
    @area_id = @user.area_id
    if @area_id.present? == true 
        @user_area = Area.find(@area_id)
        @voivodeship_id = @user_area.voivodeship_id
        @user_voivodeship = Voivodeship.find(@voivodeship_id)
        @com = Commitee.where(voivodeship_id: @user_voivodeship.id)
        if @user_voivodeship.commitees.length == 0
          @assosciated_commitees = "None"
        else
          @assosciated_commitees = @user_voivodeship.commitees.map(&:id)
        end
    end

    @vote = Vote.find(params[:id])
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Głosy zostały zaktualizowane.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Głosy zostały usunięte.' }
      format.json { head :no_content }
    end
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:number, :commitee_id, :area_id)
    end
end