get '/' do
  redirect 'http://www.modernloves.com'
end

get '/app' do
  erb :index
end
