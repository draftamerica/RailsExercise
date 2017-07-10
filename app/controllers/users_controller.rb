class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def new_user_post
      puts "\n****** new_user_post ******"
  end

  def home
      puts "\n****** home ******"
      @users = User.all
      @user =  User.find(session[:user_id])
      puts "\n****** @user.inspect, #{@user.inspect} ******"
      @address = Address.new
      @post = Post.new
  end

  def edit
	@post = Post.find(params[:id])		# get the post for which the comment is created
	@comment = Comment.new					# generate a new comment object to hold submitted data
  end

  def login_form
      puts "\n****** login_form ******"
  end

    def login
          puts "\n******* login *******"
          @user = User.where(username: params[:username]).first
          if @user
              if @user.password == params[:password]
                    session[:user_id] = @user.id
                    #puts "asdf  mfhds #{@current_user.inspect}"
              @current_user = User.find_by_id(@user.id)
              puts "\n******* login successful *******"
              puts "\ncurrent_user: #{@current_user.inspect}"
                  flash[:notice] = "You've been signed in successfully."
                  redirect_to '/home'
              else
                  flash[:notice] = "Please check your password and try again."
                  redirect_to "/login_form"
              end
          else
              flash[:notice] = "Please check your username and try again."
              redirect_to "/login_form"
          end
      end

    def logout
        session.delete(:user_id)
        flash[:notice] = "You've been signed out successfully."
        redirect_to root_url
    end


  # GET /users
  # GET /users.json
  def index
    puts "\n****** index ******"
    @users = User.all
    puts "******* @users, #{@users.inspect}"
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @posts = @user.posts
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
    puts "***** user_params *****"
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :password_confirmation)
    end
end
