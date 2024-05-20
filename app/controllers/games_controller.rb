require 'net/http'
require 'uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    # raise
    @impossible = false
    @the_word = params[:the_word]
    # raise
    @letters = params[:letters]

    @uri = URI.parse("https://dictionary.lewagon.com/#{@the_word}")
    @response = Net::HTTP.get_response(@uri)
    @data = JSON.parse(@response.body)
  end
end
