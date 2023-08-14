# frozen_string_literal: true

require 'open-uri'
# This class handles the validation of user input
class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(8) + %w[A E I O U].sample(2)
  end

  def score
    @user_answer = params[:score].upcase
    @converted_array = @user_answer.chars
    @letters = params[:letters]
    @match_data = @converted_array.all? { |letter| @letters.include?(letter) }
    # raise

    return unless @match_data

    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@user_answer}")
    json = JSON.parse(response.read)
    @english_word = json['found']
  end
end
