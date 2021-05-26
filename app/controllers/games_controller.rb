class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    binding.pry
    letters = params[:letters]
    search_word = params[:word]

    if real_word?(search_word)
      @message = "it's a real word"
    else
      @message = "it isn't a real word"
    end
  end

  private

  def real_word?(search_word)
  url = "https://wagon-dictionary.herokuapp.com/#{search_word}"
  res = JSON.parse(open(url).read)
  res['found']
  end

  def included?(letters, word)
  end
end
