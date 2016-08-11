require_relative 'config/environment'

class App < Sinatra::Base

  get "/reversename/:name" do
    @reverse = params[:name].reverse!
    @reverse
  end

  get "/square/:number" do
    @integer = params[:number].to_i
    @square = @integer*@integer
    "#{@square}"
  end

  get "/say/:number/:phrase" do
    @integer = params[:number].to_i
    @phrase = params[:phrase].split("%20").join(" ")
    "#{@phrase}\n"*@integer
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @phrase = "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
    @phrase
  end

  get "/:operation/:number1/:number2" do
    @num_1 = params[:number1].to_i
    @num_2 = params[:number2].to_i
    if params[:operation] == "add"
      @sum = @num_1 + @num_2
      @sum.to_s
    elsif params[:operation] == "subtract"
      @diff = @num_1 - @num_2
      @diff.to_s
    elsif params[:operation] == "multiply"
      @product = @num_1*@num_2
      @product.to_s
    elsif params[:operation] == "divide"
      @quotient = @num_1/@num_2
      @quotient.to_s
    end
  end
end
