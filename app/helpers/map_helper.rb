module MapHelper
  def map_vaga_status(status, codigo)
    tag = ""
    if status == StatusControll::AVAILABLE
      tag << image_tag('encore/ico/_available.png')
    elsif status == StatusControll::RESTRICTED
      tag << image_tag('encore/ico/_temporarily-not-available.png')
    else
      tag << image_tag('encore/ico/_not-available.png')
    end
    tag << '<span class="vaga_cod">'+codigo + '</span>'
    raw tag
  end
end