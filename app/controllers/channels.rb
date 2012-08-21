Generic.controllers :channels do
  get :index, :map => "/"  do
    @channel = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, {:per => 999})
    @blocks = @channel['contents'].sort_by{|b|b['position']}.select{|b|b['published'] || b['base_class'] == 'Block'}
    
    # @channels = get_public_channels(@channel).sort_by{|b|b['position']}
    # @blocks = get_blocks(@channel).shuffle!

    render 'channels/show'
  end


  get :show, :map => "/:id" do
    @channel = Arena.channel(
        params[:e] ? params[:id] : slug_decode(params[:id]), {:per => 999}
      )
    @channels = get_public_channels(@channel).sort_by{|b|b['position']}
    @blocks = get_blocks(@channel).sort_by{|b|b['position']}
    
    if request.xhr?
      render 'channels/show', :layout => false
    else
      render 'channels/show'
    end
  end

  get :thumb, :map => "/:id/thumb" do
    @channel = Arena.channel_thumb(
        params[:e] ? params[:id] : slug_decode(params[:id]), {:per => 999}
      )
  end
end