module MapHelper
  def vacancy_status(vacancy)
    tag = ""
    if vacancy.status == StatusControll::AVAILABLE
      tag << image_tag('encore/ico/_available.png')
    elsif vacancy.status == StatusControll::RESTRICTED
      tag << image_tag('encore/ico/_temporarily-not-available.png')
    else
      tag << image_tag('encore/ico/_not-available.png')
    end
    tag << '<span class="vaga_cod">'+vacancy.codigo + '</span>'
    raw tag
  end
end