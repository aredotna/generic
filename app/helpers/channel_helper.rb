Generic.helpers do

  [:channel, :block].each do |type|
    define_method "get_#{type}s" do |channel|
      channel['contents'].sort_by do |b|
        b['position']
      end.select do |b|
        b['published'] ||
        b['base_class'] == type.to_s.capitalize
      end
    end
  end

end
