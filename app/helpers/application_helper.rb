module ApplicationHelper
  def display_sidebar?
    !signed_in? || params[:controller] == "articles"
  end
end
