module ApplicationHelper
	def article_cover url, options = {}
		html_class = options[:class]
		html_style = style="background:url(#{url}); background-size: cover;"\
							"height:400px; width: 100%;"
		html = "<header style='#{html_style}' class='#{html_class}'> </header>"
		html.html_safe
	end
end
