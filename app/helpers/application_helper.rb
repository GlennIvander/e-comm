module ApplicationHelper
  def number_with_delimiter(number, options = {})
    delegate_number_helper_method(:number_to_delimited, number, options)
  end
end
