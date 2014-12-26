class QuestionsController < ApplicationController
	def fetch_user
    	@question = Question.find_by_id(params[:id])
  	end
	def index
	  	@questions = Question.all
	    respond_to do |format|
	      	format.json { render json: @questions }
	      	format.xml { render xml: @questions }
	    end
	end
	def show
    	respond_to do |format|
      		format.json { render json: @question }
      		format.xml { render xml: @question }
    	end
  	end
	def create
		@question = Question.new(params[:question])
	    respond_to do |format|
	      	if @question.save
	        	format.json { render json: @question, status: :created }
	        	format.xml { render xml: @question, status: :created }
	      	else
	        	format.json { render json: @question.errors, status: :unprocessable_entity }
	        	format.xml { render xml: @question.errors, status: :unprocessable_entity }
	      	end
	    end
	end
	def update
    	respond_to do |format|
      		if @question.update_attributes(params[:question])
        		format.json { head :no_content, status: :ok }
        		format.xml { head :no_content, status: :ok }
      		else
        		format.json { render json: @question.errors, status: :unprocessable_entity }
        		format.xml { render xml: @question.errors, status: :unprocessable_entity }
      		end
   		end
  	end
	def destroy
	    respond_to do |format|
	      	if @question.destroy
	        	format.json { head :no_content, status: :ok }
	        	format.xml { head :no_content, status: :ok }
	      	else
	        	format.json { render json: @question.errors, status: :unprocessable_entity }
	        	format.xml { render xml: @question.errors, status: :unprocessable_entity }
	      	end
	    end
	 end
end
