module MapHelper
  def vacancy_status(vacancy)
    tag = ""
    if vacancy.status == Vacancy::AVAILABLE
      tag << image_tag('encore/ico/_available.png')
    elsif vacancy.status == Vacancy::RESTRICTED
      tag << image_tag('encore/ico/_temporarily-not-available.png')
    else
      tag << image_tag('encore/ico/_not-available.png')
    end
    tag << '<span class="vacancy_cod">'+vacancy.codigo + '</span>'
    raw tag
  end
end