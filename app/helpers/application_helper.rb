module ApplicationHelper

  def current_ruc
    if params[:current_ruc]
      session[:current_ruc] = params[:current_ruc]
    else
      session[:current_ruc]
    end
  end

  def current_year
    if params[:current_year]
      session[:current_year] = params[:current_year]
    else
      session[:current_year]
    end
  end

  def current_month
    if params[:current_month]
      session[:current_month] = params[:current_month]
    else
      session[:current_month]
    end
  end

end
