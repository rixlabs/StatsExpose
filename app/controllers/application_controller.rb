class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def widget_box(widget)
    if widget.chart_type == "map"
      render :partial => 'widgets/widget_map',

    else
      render :partial => 'widgets/widget_chart',
             :locals => {:popover_id => id, :header => header, :body => body,
                         :footer => footer, :before => before, :after => after}
    end

  end
  helper_method :widget_box
end
