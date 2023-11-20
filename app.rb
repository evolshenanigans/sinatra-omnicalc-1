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

get("/random/result") do
  min = params[:min].to_f
  max = params[:max].to_f
  random_number = rand(min..max).round(17)
  @min = min
  @max = max
  @result = random_number
  erb(:randomresult)
end

get("/payment/result") do
  principal = params[:principal].to_f.round(2)
  annual_rate = params[:apr].to_f
  apr = annual_rate / 100
  years = params[:years].to_i

  monthly_rate = apr / 12
  total_payments = years * 12
  monthly_payment = principal * (monthly_rate * (1 + monthly_rate)**total_payments) / ((1 + monthly_rate)**total_payments - 1)

  @principal = principal
  @apr = annual_rate.round(4)
  @years = years
  @result = monthly_payment.round(2)
  erb(:paymentresult)
end
