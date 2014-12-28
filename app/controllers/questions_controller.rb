class QuestionsController < ApplicationController
	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = '*' 
		headers['Access-Control-Request-Method'] = '*' 
	end
	def fetch_question
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
		@question = Question.find_by_id(params[:id])
    	respond_to do |format|
      		format.json { render json: @question }
      		format.xml { render xml: @question }
    	end
  	end
	def create
		@question = Question.new(question_params)
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
		@question = Question.find_by_id(params[:id])
    	respond_to do |format|
      		if @question.update_attributes(question_params)
        		format.json { head :no_content, status: :ok }
        		format.xml { head :no_content, status: :ok }
      		else
        		format.json { render json: @question.errors, status: :unprocessable_entity }
        		format.xml { render xml: @question.errors, status: :unprocessable_entity }
      		end
   		end
  	end
	def destroy
		@question = Question.find_by_id(params[:id])
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
	def question_params
      params.require(:question).permit(:id, :description, :answer, :option1, :option2, :option3)
    end
end
