require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
erb(:square)
end

get("/square_root/new") do
  erb(:squareroot)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end

get("/square/result") do
  number = params[:square].to_i
  square = number ** 2
  @number = number
  @result = square
  erb(:squareresult)
end
get("/squareroot/result") do
  number = params[:squareroot].to_i
  square_root = Math.sqrt(number)
  @number = number
  @result = square_root
  erb(:squarerootresult)
end
