require_relative 'garment'

class Wardrobe
  attr_reader :garments
  
  def self.from_dir(dir_path)
    garments = 
      Dir[File.join(dir_path, '*.txt' )].
        map { |txt_path| Garment.from_txt(txt_path) }
    
    new(garments)
  end

  def initialize(garments)
    @garments = garments
  end

  def clothes_for_weather(temperature)
    garments.select { |garment| garment.suitable_for_weather?(temperature)}.
    shuffle.uniq(&:type)
  end
end
