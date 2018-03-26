require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'elasticsearch' do
    before do
      Person.destroy_all
    end

    after do
      person.destroy
    end

    let(:first_name) { "first #{DateTime.now.to_i}" }
    let(:last_name) { "last #{DateTime.now.to_i}" }
    let!(:person) { Person.create!(first_name: first_name, last_name: last_name) }
    let(:get_params) do
      {
        index: Person.index_name, id: person.id
      }
    end
    let!(:document) { Person.__elasticsearch__.client.get(get_params) }

    it 'indexes model data' do
      expect(document['_source']['id']).to eq(person.id)
      expect(document['_source']['first_name']).to eq(first_name)
      expect(document['_source']['last_name']).to eq(last_name)
    end
  end
end