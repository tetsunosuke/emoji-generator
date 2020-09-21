require 'rmagick'
require 'pry'
require 'securerandom'
require 'nkf'


include Magick

class EmojiImage
  attr_reader :path

  def initialize(text)
    f = Magick::Image.new(64, 64) do
      self.background_color= "Transparent"
    end

    d = Magick::Draw.new

    padding = 1
    fontsize = 64 - padding * 5
    color = ['#F44336', '#9C27B0', '#3F51B5', '#03A9F4', '#009688', '#8BC34A', '#FFEB3B', '#FF9800', '#795548'].sample

    d.annotate(f, 0, 0, padding, -12, text) do
      self.pointsize = fontsize
      self.fill = color
      self.font = 'MPLUSRounded1c-Bold.ttf'
      self.gravity = Magick::NorthGravity
    end

    @path = "#{text}.png"
    f.write(@path)
  end
end

"あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉゃゅょっ".chars.each { |chr|
  image = EmojiImage.new(chr)
}

