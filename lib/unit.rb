# frozen_string_literal: true

require_relative "unit/version"

module Unit
  class Error < StandardError; end
  include HTTParty
  base_uri 'https://balldontlie.io/api/v1'

  attr_reader :first_name, :last_name, :height_feet, :height_inches, :position,:team_id, :weight_pounds

  def initialize(first_name, last_name, height_feet,
                 height_inches, position, team_id, weight_pounds)
    @first_name = first_name
    @last_name = last_name
    @height_feet = height_feet
    @height_inches = height_inches
    @position = position
    @team_id = team_id
    @weight_pounds = weight_pounds
  end

  def call
    args = {
      first_name: first_name,
      last_name: last_name,
      height_feet: height_feet,
      height_inches: height_inches,
      position: position,
      team_id: team_id,
      weight_pounds: weight_pounds
    }
    response = self.class.post("/players", :body => args.to_json, :headers => { 'Content-Type' => 'application/json' })
    response
  end

end

puts Unit.new("Andy","White", 500, 800, 1, 7, 2.0 ).call
