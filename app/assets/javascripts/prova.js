dojo.provide("ch.lugano.GraphController");
dojo.declare("ch.lugano.GraphController", null, {

	chart: null,
	dataTable: null,

	params: {
		title: 'Abitanti',
		width: 600, height: 600,
		vAxis: {title: 'Quartiere',  titleTextStyle: {color: 'red'}},
		hAxis: {title: "Abitanti"}
	},
	
	draw: function(data) {
		this.dataTable = google.visualization.arrayToDataTable(data);
		this.chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		this.chart.draw(this.dataTable, this.params);
	},
	
	constructor: function(args) {
		dojo.safeMixin(this, args);
		$.getJSON("http://localhost:3000/demographics", this.draw);
		EventBus.addEventListener("mapClicked", function(event) {
			var query = event.target;
			for(i = 0; i < dataTable.getNumberOfRows(); i++) {
				for (j = 0; j < dataTable.getNumberOfColumns(); j++) {
					if(dataTable.getValue(i, j).toString().toLowerCase().match(query.toLowerCase())) {
							this.chart.setSelection([{row:i, column:null}]);
							break;
					}
				}
			}
		}, this);
	}

});