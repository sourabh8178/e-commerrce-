module ApplicationHelper
	def active_class?(active_url)
    return 'active' if params[:controller] == active_url
    ''
  end
end
