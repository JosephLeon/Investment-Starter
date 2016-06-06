class GspcsController < ApplicationController
	def index
		@gpscs = Gspc.all
	end
end
