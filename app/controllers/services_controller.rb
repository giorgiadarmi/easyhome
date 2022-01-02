class ServicesController < ApplicationController
	def index
		@all = Service.all
	end
end
