class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
  erb :index
  end

  get '/recipes/new' do
    erb:new
  end

  post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"#{@article.id}'

    delete '/recipes/:id' do
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.delete
      redirect to '/recipes'
    end
end
end
