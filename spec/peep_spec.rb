require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      # add test data
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES ('This is so cool');")
      connection.exec("INSERT INTO peeps (content) VALUES ('I am sending a peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Isolation #COVID-19');")

      peeps = Peep.all

      expect(peeps[0][:content]).to eq 'Isolation #COVID-19'
      expect(peeps[1][:content]).to eq 'I am sending a peep'
      expect(peeps[2][:content]).to eq 'This is so cool'
    end
  end
end