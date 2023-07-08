require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    parent_method = super
    parent_method && @last_played_at.year < (Date.today.year - 2)
  end
end