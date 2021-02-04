class UsersController < ApplicationController
  # before_action :set_user, only: %i[destroy ]
 
  before_action :set_user, only: [:show, :edit, :update, :destroy, :patch]
  before_action :authenticate_user



  # def create
    
  #   @user = User.new(user_params)
    
  #     if @user.save

  #       auth_token = Knock::AuthToken.new payload: { sub: @user.id }
  #       render json: {user: @user, token: auth_token} , status: :created
       
  #     else
  #       render json: @user.errors.full_messages, status: :unprocessable_entity
  #     end
  # end
  # GET /users or /users.json
  def index
    @users = User.all
    # @users = User.all.with_attached_avatar
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: "User was successfully created." }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # def create
    
  #   @user = User.new(user_params)
    
  #     if @user.save

  #       auth_token = Knock::AuthToken.new payload: { sub: @user.id }
  #       render json: {user: @user, token: auth_token} , status: :created
       
  #     else
  #       render json: @user.errors.full_messages, status: :unprocessable_entity
  #     end
  # end
  def create
    
    @user = User.new(user_params)
    @user.password_digest = params[:password]
      if @user.save

        auth_token = Knock::AuthToken.new payload: { sub: @user.id }
        render json: {user: @user, token: auth_token} , status: :created
       
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: "User was successfully updated." }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    # def user_params
    #   params.permit(:username, :email, :password, :password_confirmation)
    #  end
end
