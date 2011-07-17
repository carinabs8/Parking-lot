class AutoCompleteController < ApplicationController
  def maps_list
    @maps = Map.all
    @maps_hash = []
    
    @maps.each do |m|
      @maps_hash << {"label" => m.codigo}
    end
    render :json => @maps_hash.to_json
  end

end
