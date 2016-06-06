class GspcsController < ApplicationController
	def index
		@gspcs = Gspc.all
	end
end
