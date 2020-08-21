class ItemsController < ApplicationController

  before_action :move_to_sign_in, except: [:index, :show]
  def index
  end
  
  def show
  end

  def move_to_sign_in
   unless user_signed_in?
     redirect to user_session_path
   end
  end
end
