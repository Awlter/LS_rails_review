module ApplicationHelper
  def queue_item_rating_options(selected=nil)
    options_for_select(5.downto(1).map { |n| [pluralize(n, 'Star'), n]}, selected)
  end
end
