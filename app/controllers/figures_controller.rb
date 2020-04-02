class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'/figures/new'
  end 

  post '/figures' do
    binding.pry
    @figure = Figure.create(params)
  end
  
end
