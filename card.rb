class Card
  attr_reader :name, :type, :value, :points

  NUM_PATTERN = /^(10|[2-9])[♣♦♥♠]{1}$/.freeze
  IMG_PATTERN = /^[ВДК][♣♦♥♠]{1}$/.freeze
  ACE_PATTERN = /^Т[♣♦♥♠]{1}$/.freeze

  def initialize(name)
    @name = name
    case name
    when NUM_PATTERN
      init_num_card
    when IMG_PATTERN
      init_img_card
    when ACE_PATTERN
      init_ace_card
    else
      raise "#{name} - нет такой карты!"
    end
    @points = PointsCounter.count_points([self])
  end

  private

  def init_num_card
    @type = :num
    @value = NUM_PATTERN.match(@name)[0]
  end

  def init_img_card
    @type = :img
    @value = IMG_PATTERN.match(@name)[0]
  end

  def init_ace_card
    @type = :ace
    @value = ACE_PATTERN.match(@name)[0]
  end
end
