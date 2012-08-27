Generic.controllers :blocks do
  before do
    # session[:breadcrumb] =+ "{ :path => #{request.path} }"
    # puts "\n\n\n\n\n#{session[:breadcrumb]}\n\n\n\n\n"
  end

  get :show, :map => "/view/:id" do
    @block = Arena.block(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    
    render "blocks/show"
  end

end
