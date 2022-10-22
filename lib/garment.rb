class Garment
  attr_reader :title, :type, :temp_range

  class << self
    def from_txt(txt_path)
      lines = File.readlines(txt_path, chomp: true)

      new(title: lines[0], type: lines[1], temp_range: parse_range(lines[2]))
    end

    private

    def parse_range(line)
      Range.new(*line.scan(/-?\d+/).map(&:to_i))
    end
  end

  def initialize(params)
    @title = params[:title]
    @type = params[:type]
    @temp_range = params[:temp_range]
  end

  def suitable_for_weather?(temperature)
    temp_range.include?(temperature)
  end

  def to_s
    "#{@title} (#{@type}) #{@temp_range}"
  end
end
