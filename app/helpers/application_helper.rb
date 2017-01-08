module ApplicationHelper

  def link_fi_to(icon_name, text, link)
    link_to content_tag(:i, text, :class => "fi-#{icon_name}"), link
  end
end
