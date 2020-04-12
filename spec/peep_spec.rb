require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps, in reverse chronological order, when combined with order' do
      # add test data
      Peep.create(content: 'This is so cool')
      Peep.create(content: 'I am sending a peep')
      Peep.create(content: 'Isolation #COVID-19')

      peeps = Peep.all.order(created_at: :desc)

      most_recent_peep = Peep.last

      expect(peeps.length).to eq 3
      expect(peeps.first.content).to eq 'Isolation #COVID-19'
      expect(peeps.first.id).to eq most_recent_peep.id
      expect(peeps.first.time).to eq most_recent_peep.time
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      test_peep = Peep.create(content: 'this is a test peep')
      
      expect(test_peep.content).to eq 'this is a test peep'
    end
  end

  describe '.author_name' do
    it 'returns the name of the author' do
      user = user_create_dave

      test_peep = Peep.create(content: 'this is a test peep', user_id: user.id)

      expect(test_peep.author_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end