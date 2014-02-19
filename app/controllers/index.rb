get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/generate' do
  if (a = Url.find_by(long_url: params["long_url"]))
    @short_url = a.short_url
  else
   a = Url.create(long_url: params["long_url"])
    @short_url = a.short_url
  end
  erb :shorty
end

get '/:short_url' do
  @shorty = Url.find_by(short_url: params[:short_url])
  if @shorty
    erb :get_shorty
  else
    #display not found

    @message = "URL not found"
    erb :index
  end
end

