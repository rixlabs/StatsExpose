json.array!(@widgets) do |widget|
  json.extract! widget, :dashboard_id, :sequence, :content, :size
  json.url widget_url(widget, format: :json)
end
