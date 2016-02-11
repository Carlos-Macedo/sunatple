module ApplicationHelper

  def current_ruc
    if params[:current_ruc]
      session[:current_ruc] = params[:current_ruc]
    elsif session[:current_ruc].nil?
      session[:current_ruc] = "20473159644"
    else
      session[:current_ruc]
    end
  end

  def current_year
    if params[:current_year]
      session[:current_year] = params[:current_year]
    elsif session[:current_year].nil?
      session[:current_year] = Time.zone.now.year
    else
      session[:current_year]
    end
  end

  def current_month
    if params[:current_month]
      session[:current_month] = params[:current_month]
    elsif session[:current_month].nil?
      session[:current_month] = Time.zone.now.month
    else
      session[:current_month]
    end
  end

end
