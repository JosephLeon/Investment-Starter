class GspcsController < ApplicationController
	def index
		@gspcs = Gspc.all
		@latest5gspcrecords = Gspc.take(5)

		@latest5dates = []
		@latest5closes = []
		@latest5opens = []
		@latest5gspcrecords.each do |gspc|
			@latest5dates << gspc.date
			@latest5closes << gspc.close
			@latest5opens << gspc.open
		end

		@data = {
	    labels: @latest5dates,
	    datasets: [
	    	{
	    		label: "My Firstest dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(15,162,142,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latest5closes,
	    	},
        {
          label: "My First dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(75,192,192,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latest5opens,
        },
        {
          label: "My Second dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latest5closes,
        }
     	]
		}
		@options = {}
	end
end
