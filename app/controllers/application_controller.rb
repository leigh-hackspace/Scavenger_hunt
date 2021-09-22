class ApplicationController < ActionController::Base
  before_action :custom_headers

  private

  def custom_headers
    response.set_header('X-Clacks-Overhead', 'GNU Terry Pratchett') 
  end
end
