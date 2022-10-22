require 'wardrobe'

describe Wardrobe do
  let(:garments) do
    [
      Garment.new(title: 'Брюки', type: 'Штаны', temp_range: +5..+20),
      Garment.new(title: 'Рубашка', type: 'На тело', temp_range: -5..+20),
      Garment.new(title: 'Туфли', type: 'Обувь', temp_range: +8..+23)
    ]
  end

  let(:wardrobe) { described_class.new(garments) }

  describe '::from_dir' do
    let(:wardrobe_from_dir) do
      described_class.from_dir("#{__dir__}/fixtures/")
    end

    it "returns instance of #{described_class}" do
      expect(wardrobe_from_dir).to be_a Wardrobe
    end

    it 'should read all files from dir' do
      expect(wardrobe_from_dir.garments.size).to eq 3
    end

    it 'should create collection from dir' do
      expect(wardrobe_from_dir.garments).to all be_a Garment
    end

    it 'should read files correctly' do
      expect(wardrobe_from_dir.garments)
        .to contain_exactly(
          an_object_having_attributes(title: 'Брюки', type: 'Штаны', temp_range: +5..+20),
          an_object_having_attributes(title: 'Рубашка', type: 'На тело', temp_range: -5..+20),
          an_object_having_attributes(title: 'Туфли', type: 'Обувь', temp_range: +8..+23)
        )
    end
  end

  describe '::new' do
    it 'assigns instance varaible' do
      expect(wardrobe.garments).to eq garments
    end
  end

  describe '#clothes_for_weather' do
    context 'when clothes for given temp exists' do
      it 'should return suitable clothes' do
        expect(wardrobe.clothes_for_weather(+6).size).to eq 2
        expect(wardrobe.clothes_for_weather(+6).map(&:type)).to match_array ['Штаны', 'На тело']
      end
    end

    context 'when clothes for given temp do not exist' do
      it 'should return empty array' do
        expect(wardrobe.clothes_for_weather(-10)).to be_an(Array).and be_empty
      end
    end
  end
end
