Generic.helpers do

  def get_blocks(channel)
    channel['contents'].sort_by do |b|
      b['position']
    end.select do |b|
      b['published'] || b['base_class'] == 'Block'
    end
  end

end
