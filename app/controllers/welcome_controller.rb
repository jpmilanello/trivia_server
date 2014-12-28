class WelcomeController < ApplicationController
  def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = '*' 
		headers['Access-Control-Request-Method'] = '*' 
	end
  def index
  end
end
