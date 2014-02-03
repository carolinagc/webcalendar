module ApplicationHelper
  def boolean_to_words(value)
    value ? I18n.t(:yes) : I18n.t(:no)
  end
end
