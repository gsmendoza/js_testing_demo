class PagesController < ActionController::Base
  def presentation
    render :layout => false
  end
end
