Jtt.helpers do

  def get_public_channels(channel)
    channel['contents'].select{|b|b['class']=='Channel'}.reject{|c|c['published']==false}
  end

  def get_blocks(channel)
    channel['contents'].reject{|b|b['class']=='Channel'}
  end

end
