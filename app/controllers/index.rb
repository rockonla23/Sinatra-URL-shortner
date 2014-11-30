get '/' do
  # Look in app/views/index.erb
   @shorten_url = ShortenedUrl.new

    @shorten_url_all = ShortenedUrl.all

  erb :index
end

post '/' do
  # create a new Url
  @shorten_url = ShortenedUrl.new(url: params[:url])
  @shorten_url_all = ShortenedUrl.all
  if @shorten_url.save
    erb :index
    # redirect @shorten_url.url
  else
    erb :index
  end
end

# e.g., /q6bda
get '/:shorten_link' do
  # redirect to appropriate "long" URL
  @shorten_link = ShortenedUrl.find_by(shorten_link: params[:shorten_link])
  @shorten_link.counter
   redirect @shorten_link.url
end
