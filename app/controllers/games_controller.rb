require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    game_array = (0...9).to_a
    $letters = game_array.map! { ('A'..'Z').to_a.sample }
  end

  def score
    word = params[:word]
    url = "https://dictionary.lewagon.com/#{word}"
    response_open = URI.open(url).read
    @response = if word.upcase.included?($letters.join)
                  if response_open.found
                    return "Congratulations! #{word.upcase} is a valid English word!"
                  else
                    return "Sorry but #{word.upcase} does not seem to be a valid English word..."
                  end
                else
                  return "Sorry but #{word.upcase} can't be built out of #{$letters.join(',')}"
                end
  end
end
