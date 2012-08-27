Generic.controllers :channels do

  get :index, :map => "/"  do
    @channel = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { :per => 999 })
    @blocks = get_blocks(@channel)

    render 'channels/show'
  end


  get :show, :map => "/:id" do
    @channel = Arena.channel(
        params[:e] ? params[:id] : slug_decode(params[:id]), { :per => 999 }
      )
    @blocks = get_blocks(@channel)
    render 'channels/show'
  end

  get :thumb, :map => "/:id/thumb" do
    @channel = Arena.channel_thumb(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    @blocks = get_blocks(@channel)

    render 'channels/thumb', :layout => false
  end

  get :channels, :map => "/:id/channels" do
    @channels = Arena.channel_channels(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )['channels'].select { |c| c['published'] }
    render 'channels/channels', :layout => false
  end

end