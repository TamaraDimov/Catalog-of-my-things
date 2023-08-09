# spec/label_spec.rb
require_relative '../label'
require_relative '../item'

describe Label do
  let(:label_id) { 1 }
  let(:label_title) { 'Test Label' }
  let(:label_color) { 'blue' }
  let(:label_items) { [] }
  let(:label) { Label.new(label_id, label_title, label_color) }

  describe '#initialize' do
    it 'sets the id, title, color, and initializes items' do
      expect(label.id).to eq(label_id)
      expect(label.title).to eq(label_title)
      expect(label.color).to eq(label_color)
      expect(label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      item = double('Item')
      allow(item).to receive(:label=)
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'sets the label of the added item to itself' do
      item = double('Item')
      expect(item).to receive(:label=).with(label)
      label.add_item(item)
    end
  end
end
