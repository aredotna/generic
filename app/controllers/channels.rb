Generic.controllers :channels do
  get :index, :map => "/"  do
    @channel = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, {:per => 999})
    @blocks = @channel['contents'].sort_by{|b|b['position']}.select{|b|b['published'] || b['base_class'] == 'Block'}

    render 'channels/show'
  end


  get :show, :map => "/:id" do
    @channel = Arena.channel(
        params[:e] ? params[:id] : slug_decode(params[:id]), {:per => 999}
      )
    @blocks = @channel['contents'].sort_by{|b|b['position']}.select{|b|b['published'] || b['base_class'] == 'Block'}
    render 'channels/show'
  end

  get :thumb, :map => "/:id/thumb" do
    @channel = Arena.channel_thumb(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    @blocks = @channel['contents'].sort_by{|b|b['position']}.select{|b|b['published'] || b['base_class'] == 'Block'}

    render 'channels/thumb', :layout => false
  end
end