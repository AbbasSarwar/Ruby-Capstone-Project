require 'date'
require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    is_expired = Time.now.year - Date.parse(@last_played_at).year > 2
    super && is_expired
  end
end
