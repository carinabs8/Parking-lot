module ApplicationHelper

  FLASH_TYPES = [:error, :warning, :success, :message]

  def show_msg(text, type)
    unless text.nil?
      id   = case type
               when :success
                 "msgConfirm"
               when :error
                 "msgError"
               when :warning
                 "msgWarning"
               when :message
                 "msgInfo"
             end
     raw "<div id=\"#{id}\" class=\"message\">#{text}</div>"
    end
  end

  def logged_in?
    !current_user.nil? && current_user.id.to_i > 0
  end

  def is_active?(controller_name)
    "active" if params[:controller] == controller_name
  end

  def show_error_in_form(text)
    "<p class=\"error clear\">#{text.join(',')}</p>" unless text.nil? || text.blank?
  end
  
  def vacancy_status(vacancy)
    status = "#{label :vacancy, :situacao} "
    if vacancy.status == StatusControll::AVAILABLE
      status << "Disponivel"
    elsif vacancy.status == StatusControll::RESTRICTED
      status << "Interditada"
    else
      status << "Ocupada"
    end
  end
  
end