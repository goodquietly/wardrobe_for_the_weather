require 'garment'

describe Garment do
  let(:garment) do
    described_class.new(title: 'Брюки', type: 'Штаны', temp_range: +5..+20)
  end

  describe '::from_txt' do
    let(:garment_from_txt) do
      described_class.from_txt("#{__dir__}/fixtures/pants.txt")
    end

    it "returns instance of #{described_class}" do
      expect(garment_from_txt).to be_a Garment
    end

    it 'parses file correctly' do
      expect(garment_from_txt).to have_attributes(title: 'Брюки', type: 'Штаны', temp_range: +5..+20)
    end
  end

  describe '::new' do
    it 'assigns instance varaibles' do
      expect(garment).to have_attributes(title: 'Брюки', type: 'Штаны', temp_range: +5..+20)
    end
  end

  describe '#suitable_for_weather?' do
    context 'when garment suits for given temp' do
      it 'returns true' do
        expect(garment.suitable_for_weather?(+7)).to be true
      end
    end

    context 'when garment doesnt suit for given temp' do
      it 'returns false' do
        expect(garment.suitable_for_weather?(-10)).to be false
      end
    end
  end

  describe '#to_s' do
    it 'returns correctly written garment' do
      expect(garment.to_s).to eq 'Брюки (Штаны) 5..20'
    end
  end
end
