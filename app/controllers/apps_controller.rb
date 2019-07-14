class AppsController < ApplicationController
	def index
		@heading = "MyData Apps & Services"
		@heading_short = "Apps & Services"
		if params[:mode].to_s == ""
			@app = App.where(status: 1)
		else
			@app = App.all
		end
	end

	def show
		app_id = params[:id]
		@app = App.find(app_id)
		@posts = []
		if @app.nil?
			@heading = "MyData Apps & Services"
			@heading_short = "Apps & Services"
		else
			@heading = "Apps & Services: " + @app.title.to_s
			@heading_short = @app.title.to_s
			if params[:mode].to_s == ""
				@posts = @app.weekly_apps.where(status: 1)
			else 
				@posts = @app.weekly_apps
			end
		end
	end
end