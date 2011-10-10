module ApplicationHelper

  FLASH_TYPES = [:error, :warning, :success, :message]

  def show_msg(text, type)
    unless text.nil?
      id   = case type
               when :success
                 # This is a confirmation of your action.
                 "msgConfirm"
               when :error
                 # This is a confirmation of your action.
                 "msgError"
               when :warning
                 # This is a confirmation of your action.
                 "msgWarning"
               when :message
                 # This is a confirmation of your action.
                 "msgInfo"
             end
      "<div id=\"#{id}\" class=\"message\">#{text}</div>"
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
  
  def vaga_status(vaga)
    status = "#{label :vaga, :situacao} "
    if vaga.id.nil? || vaga.vaga_status.last.status == StatusControll::AVAILABLE
      status << "Disponivel"
    elsif vaga.vaga_status.last.status == StatusControll::RESTRICTED
      status << "Interditada"
    else
      status << "Ocupada"
    end
  end
  
end