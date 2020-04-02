class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'/figures/new'
  end 

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    #binding.pry
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
    else
      @title = params[:title]
    end
    if !params[:landmark][:name].empty?
      @lm = Landmark.create(params[:landmark])
    else
      @lm = params[:landmark]
    end
    #binding.pry
    @lm.figure_id = @figure.id
    @lm.save
    FigureTitle.create(figure_id: @figure.id, title_id: @title.id)
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :edit
  end
  
end
