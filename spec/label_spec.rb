# label_spec.rb
require_relative '../label'
require 'date'

describe Label do
  let(:title) { 'Sample Label' }
  let(:color) { 'blue' }
  let(:item1) { Item.new(Date.today) }
  let(:item2) { Item.new(Date.today) }
  let(:items) { [item1, item2] }

  subject { described_class.new(title, color, items) }

  describe '#initialize' do
    it 'creates a Label instance' do
      expect(subject).to be_an_instance_of(Label)
    end

    it 'has the correct attributes' do
      expect(subject.title).to eq(title)
      expect(subject.color).to eq(color)
      expect(subject.items).to eq(items)
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Gift', 'red', [])
      item = Item.new(Date.today - 5)
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end

  describe '#to_h' do
    it 'converts the label to a hash' do
      label_hash = subject.to_h
      expect(label_hash[:id]).to eq(subject.id)
      expect(label_hash[:title]).to eq(title)
      expect(label_hash[:color]).to eq(color)
      expect(label_hash[:items]).to eq(items.map(&:to_h))
    end
  end
end
