class Widget < ActiveRecord::Base
  belongs_to :dashboard

  CHART_TYPE = {
      :map => "Mappa",
      :AreaChart => "Area chart",
      :PieChart => "Pie Chart",
      :ColumnChart => "Column chart",
      :LineChart => "Line chart",
      :Table => "Table",
      :BarChart => "Bar chart"
  }

  SIZES = {
      'col-md-6' => '50%',
      'col-md-12' => '100%'
  }

  ENDPOINTS = {
      'Popolazione per quartiere su X anni' => 'http://pws0000461.lugano.ch:3131/demographics?indicator[method]=total_by_year_quartiere&indicator[quartiere_id]=1&indicator[from]=1999&indicator[to]=2012',
      'Totale annuo' => 'http://pws0000461.lugano.ch:3131/demographics?indicator[method]=totale_quartieri_anno&indicator[year]=2012',
      'Totale attuale' => 'http://pws0000461.lugano.ch:3131/demographics?indicator[method]=totale_abitanti'
  }
end
