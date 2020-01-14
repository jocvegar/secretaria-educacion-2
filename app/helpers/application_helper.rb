module ApplicationHelper
	def title_helper(title = '')
		if title.empty?
			"Secretaría de Educación"
		else
			"Secretaría de Educación | " + title
		end
	end

	def active_class(link_path)
	  current_page?(link_path) ? "active" : ""
	end
end
