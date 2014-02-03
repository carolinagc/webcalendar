module ApplicationHelper
  def boolean_to_words(value)
    value ? I18n.t('base.yes') : I18n.t('base.no')
  end
end
