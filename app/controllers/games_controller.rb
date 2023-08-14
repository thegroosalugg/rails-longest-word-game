class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @user_answer = params[:score].upcase
    @letters = params[:letters]
    @result = @user_answer == @letters
    # raise
  end
end
