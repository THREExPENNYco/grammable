class GramsController < ApplicationController
   # require the user signed-in before controller 
 before_action :authenticate_user!, only: [:new, :create]
  # root page for the application 
  def index 
  end 
  # saves a Gram to the database and redirects back to index 
  def create 
    @gram = current_user.grams.create(gram_params)
    # validates the gram to make sure it is passing validation 
    if @gram.valid? 
      redirect_to root_path
    else 
      # returns page Unauthorized because of http status" 
      @gram.errors.messages
      render plain: "#{@gram.errors.messages}", status: :unprocessable_entity
    end 
  end 
  #creates a new Gram object 
  def new 
    @gram = Gram.new
  end 


  private 

  def gram_params 
    params.require(:gram).permit(:message)
  end 

end
