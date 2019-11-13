module ApplicationHelper
  private def html_for_form(url_for_form, options)
    html_options = super(url_options, options)
    html_options["accept-charset"]  = "UTF-8"
    html_options
  end

  def utf8_enforcer_tag
    "".html_safe
  end
end
