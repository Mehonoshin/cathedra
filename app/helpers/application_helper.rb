module ApplicationHelper
  def display_sidebar?
    !signed_in? || ["articles", "materials"].include?(params[:controller])
  end
end
