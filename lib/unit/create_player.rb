# frozen_string_literal: true

require "httparty"

class CreatePlayer
  include HTTParty
  base_uri "https://balldontlie.io/api/v1"

  attr_reader :first_name, :last_name, :height_feet, :height_inches, :position, :team_id, :weight_pounds

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
    self.class.post("/players", :body => args.to_json, :headers => { "Content-Type" => "application/json" })
  end

end
