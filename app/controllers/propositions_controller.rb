class PropositionsController < ApplicationController
  before_action :set_proposition, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy, :new, :create]
  # GET /propositions
  # GET /propositions.json
  def index
    @propositions = Proposition.all.order('created_at DESC')
  end

  # GET /propositions/1
  # GET /propositions/1.json
  def show
  end

  # GET /propositions/new
  def new
    @proposition = Proposition.new
  end

  # GET /propositions/1/edit
  def edit
  end

  # POST /propositions
  # POST /propositions.json
  def create
    @proposition = Proposition.new(proposition_params)

    respond_to do |format|
      if @proposition.save
        format.html { redirect_to @proposition, notice: 'Proposition was successfully created.' }
        format.json { render :show, status: :created, location: @proposition }
      else
        format.html { render :new }
        format.json { render json: @proposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propositions/1
  # PATCH/PUT /propositions/1.json
  def update
    respond_to do |format|
      if @proposition.update(proposition_params)
        format.html { redirect_to @proposition, notice: 'Proposition was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposition }
      else
        format.html { render :edit }
        format.json { render json: @proposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propositions/1
  # DELETE /propositions/1.json
  def destroy
    @proposition.destroy
    respond_to do |format|
      format.html { redirect_to propositions_url, notice: 'Proposition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def like
    @proposition = Proposition.find(params[:id])
  
    if current_user
      current_user.like!(@proposition)
      redirect_to propositions_path
    end   
  end

def unlike
   @proposition = Proposition.find(params[:id])

  if current_user
    current_user.unlike!(@proposition)
    redirect_to propositions_path
  end
end
#def list
#    @users = User.all
#end


  private

    def authorize
        if signed_in?
            if current_user.role == 'A'
                return true
                else if current_user.role == nil
                    flash[:error]="Error1!"
                    redirect_to propositions_path
                else if current_user.role == 'U'
                    flash[:error]="Error2!"
                    redirect_to propositions_path
                end
                end
            end
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_proposition
      @proposition = Proposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposition_params
      params.require(:proposition).permit(:title, :descrition, :resolved)
    end
end
