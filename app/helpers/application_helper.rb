module ApplicationHelper


  def widget_box(widget)
    if (widget.chart_type == "map") then
      render(:partial => 'widgets/widget_map',locals: {id: widget.id, size: widget.size}).to_s

    else
      render(:partial => 'widgets/widget_chart',
             locals: {id: widget.id, size: widget.size,endpoint: widget.endpoint,chart_type: widget.chart_type,title: widget.title, indicator: widget.indicator}).to_s
    end

  end

end
