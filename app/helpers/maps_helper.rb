module MapsHelper
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

  def link_to_add_vacancy(vacancy, menu=false)
    stylies = ""
    classes = ""

    if menu
      classes = "adiciona_vacancy_ao_map"
    else
      classes = "change_vacancy_coordenate"
      stylies = "position: absolute; top:#{vacancy.eixo_x}; left:#{vacancy.eixo_y};"
    end
    link = "
      <a href='#' class='#{classes}' data-vacancy= '#{vacancy.id}' style='#{stylies}'>
        <div id='update_vacancy_#{vacancy.id}'>"
    link << vacancy_status(vacancy)
    link << "</div>
          </a>"
    raw link
  end
end
