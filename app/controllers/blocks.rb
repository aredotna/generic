Jtt.controllers :blocks do

  get :show, :map => "/view/:id" do
    @block = Arena.block(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    
    render "blocks/show"
  end

end
