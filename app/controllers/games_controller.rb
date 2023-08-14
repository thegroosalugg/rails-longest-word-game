class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @user_answer = params[:score].upcase
    @convert_user_to_array = @user_answer.chars
    @letters = params[:letters]
    @result = @convert_user_to_array.all? { |letter| @letters.include?(letter) }
    # raise
  end
end
