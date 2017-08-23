require 'rails_helper'

describe Album do
  it { should validate_presence_of :artist }
  it { should validate_presence_of :album }
  it { should validate_presence_of :title }
  it { should validate_presence_of :year }
  it { should validate_presence_of :record_condition }

  context 'creating record' do
    subject { Album.create(record) }

    let(:record) do
      {
        artist: 'Freddie Mercury',
        album: 'Mr.Bad Guy',
        title: 'Lets turn it on',
        year: 1985,
        record_condition: '4'
      }
    end

    context 'all fields present' do
      it 'should create a record' do
        expect { subject }.to change { Album.count }.by(1)
      end
    end

    context 'album field missing' do
      let(:record) do
        {
          artist: 'Freddie Mercury',
          title: 'Lets turn it on',
          year: '1985',
          record_condition: '4'
        }
      end

      it 'not create the record' do
        expect { subject }.to change { Album.count }.by(0)
      end
    end
  end
end
