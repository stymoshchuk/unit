# frozen_string_literal: true

require "httparty"
require_relative "unit/version"

module Unit
  class Error < StandardError; end

  def create_player(first_name, last_name, height_feet, height_inches, position, team_id, weight_pounds)
    CreatePlayer.new(first_name, last_name, height_feet, height_inches, position, team_id, weight_pounds).call
  end
end
puts Unit.create_player
# puts CreatePlayer.new("Andy", "White", 500, 800, 1, 7, 2.0).call
