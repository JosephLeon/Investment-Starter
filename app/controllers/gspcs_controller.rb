class GspcsController < ApplicationController
  def index
    @gspcs = Gspc.all
    @latestgspcrecords = Gspc.take(20)

    @latestdates = []
    @latestcloses = []
    @latestopens = []
    @latestgspcrecords.each do |gspc|
      @latestdates << gspc.date
      @latestcloses << gspc.close
      @latestopens << gspc.open
    end

    @data = {
      labels: @latestdates,
      datasets: [
        {
          label: "My Firstest dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(15,162,142,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latestcloses,
        },
        {
          label: "My First dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(75,192,192,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latestopens,
        },
        {
          label: "My Second dataset",
          fillColor: "rgba(220,220,220,0.0)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: @latestcloses,
        }
      ]
    }
    @options = {}

    respond_to do |format|
      format.html
      format.json { render :json => @gspcs.to_json }
    end
  end
end
