class Item
  attr_reader :id, :genre, :author, :label, :publish_date

  def initialize(id, publish_date)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  public

  def move_to_archive
    return unless can_be_archived?

    true
  end

  def add_genre(genre)
    return unless genre

    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_author(author)
    return unless author

    @author = author
    author.items ||= []
    author.items.push(self) unless author.items.include?(self)
  end
end
