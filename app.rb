require "sinatra"
require "sinatra/reloader"

def calculate_monthly_payment(principal, apr, years)
  monthly_rate = apr / 12
  months = years * 12
  principal * (monthly_rate / (1 - (1 + monthly_rate) ** -months))
end
def format_currency(amount)
  sprintf("$%.2f", amount)
end


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
  number = params[:square].to_f.round(2)
  square = number ** 2
  @number = number
  @result = square
  erb(:squareresult)
end
get("/squareroot/result") do
  number = params[:squareroot].to_f.round(2)
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
  principal = params[:principal].to_f
  apr = params[:apr].to_f / 100 # Convert to rate
  years = params[:years].to_i

  monthly_payment = calculate_monthly_payment(principal, apr, years)

  # Format outputs
  @monthly_payment_display = monthly_payment.to_fs(:currency)
  @apr_display = (apr * 100).to_fs(:percentage, precision: 4)
  @principal_display = principal.to_fs(:currency)
  @years = years

  erb :paymentresult
end

