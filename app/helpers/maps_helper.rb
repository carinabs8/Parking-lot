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
    if menu
      return posicionar_vaga_no_menu(vacancy)
    else
      return posicionar_vaga_na_imagem(vacancy)
    end
  end

  def posicionar_vaga_na_imagem(vacancy)
    eixo_x, eixo_y = vacancy.eixo_x, vacancy.eixo_y

    if (eixo_x.blank? && eixo_y.blank?)
      eixo_x,eixo_y = "0px", "0px"
    end
    link = "
      <a href='#' class='change_vacancy_coordenate' data-vacancy= '#{vacancy.id}' style='position: absolute; top:#{eixo_x}; left:#{eixo_y};'>
        <div id='update_vacancy_#{vacancy.id}'>"
    link << vacancy_status(vacancy)
    link << "</div>
          </a>"
    raw link
  end

  def posicionar_vaga_no_menu(vacancy)
    classes = ""
    href= ""
    if (vacancy.eixo_x.blank? && vacancy.eixo_y.blank?)
      classes = "adiciona_vacancy_ao_map"
      href = "href='#'"
    end

    link = "
      <a #{href} class='#{classes}' data-vacancy= '#{vacancy.id}'>
        <div id='update_vacancy_#{vacancy.id}'>"
    link << vacancy_status(vacancy)
    link << "</div>
          </a>"
    raw link
  end
end
