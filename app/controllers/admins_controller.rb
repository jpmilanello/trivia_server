class AdminsController < ApplicationController
	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = '*' 
		headers['Access-Control-Request-Method'] = '*' 
	end
	def fetch_user
    	@admin = Admin.find_by_id(params[:id])
  	end
	def index
	  	@admins = Admin.all
	    respond_to do |format|
	      	format.json { render json: @admins }
	      	format.xml { render xml: @admins }
	    end
	end
	def show
		@admin = Admin.find_by_id(params[:id])
    	respond_to do |format|
      		format.json { render json: @admin }
      		format.xml { render xml: @admin }
    	end
  	end
	def create
		@admin = Admin.new(user_params)
	    respond_to do |format|
	      	if @admin.save
	        	format.json { render json: @admin, status: :created }
	        	format.xml { render xml: @admin, status: :created }
	      	else
	        	format.json { render json: @admin.errors, status: :unprocessable_entity }
	        	format.xml { render xml: @admin.errors, status: :unprocessable_entity }
	      	end
	    end
	end
	def update
		@admin = Admin.find_by_id(params[:id])
    	respond_to do |format|
      		if @admin.update_attributes(user_params)
        		format.json { head :no_content, status: :ok }
        		format.xml { head :no_content, status: :ok }
      		else
        		format.json { render json: @admin.errors, status: :unprocessable_entity }
        		format.xml { render xml: @admin.errors, status: :unprocessable_entity }
      		end
   		end
  	end
	def destroy
		@admin = Admin.find_by_id(params[:id])
	    respond_to do |format|
	      	if @admin.destroy
	        	format.json { head :no_content, status: :ok }
	        	format.xml { head :no_content, status: :ok }
	      	else
	        	format.json { render json: @admin.errors, status: :unprocessable_entity }
	        	format.xml { render xml: @admin.errors, status: :unprocessable_entity }
	      	end
	    end
	 end
	def user_params
      params.require(:admin).permit(:id, :name, :lastName, :user, :email)
    end
end
