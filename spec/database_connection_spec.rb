require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end
end