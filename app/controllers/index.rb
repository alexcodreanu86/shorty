get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/generate' do
  if (a = Url.find_by(long_url: params["long_url"]))
    @short_url = a.short_url
  else
   a = Url.create(long_url: params["long_url"])
   binding.pry
    @short_url = a.short_url
  end
  erb :shorty
end
