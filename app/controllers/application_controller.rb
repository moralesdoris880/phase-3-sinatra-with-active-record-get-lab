class ApplicationController < Sinatra::Base
  set :default_content_type,'application/json'
  # get all the bakeries from the database
  # send them back as a JSON array
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  get '/bakeries/:id' do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
    bakedgood=BakedGood.all.order('price DESC')
    bakedgood.to_json
  end
  get '/baked_goods/most_expensive' do
    bakedgood=BakedGood.all.order('price DESC').limit(1)
    bakedgood.to_json
  end
end

