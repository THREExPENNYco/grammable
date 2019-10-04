class GramsController < ApplicationController
  #root page for the application 
  def index 
  end 
  #saves a Gram to the database and redirects back to index 
  def create 
    @gram = Gram.create(gram_params)
    redirect_to root_path 
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
