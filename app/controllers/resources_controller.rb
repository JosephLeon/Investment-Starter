class ResourcesController < ApplicationController
  def index
  	@resources = Resource.all
  	@gspcs = Gspc.all
  end
end
