Periscopio::Application.routes.draw do
  get "visualizer/html"

  match 'api', :to => 'locations#api'
  
  match 'viz/html', :to => 'visualizer#html'
  
  root :to => 'visualizer#html'
end
