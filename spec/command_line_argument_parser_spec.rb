require 'metasploit/command_line_argument_parser'

describe 'command_line_argument_parser' do
  describe 'parse' do
    before(:each) do
      # noinspection RubyStringKeysInHashInspection
      @expected_arguments = {
        '--connection-url' => 'http://test.connection',
        '--port' => '1234',
        '--token' => 'testtoken',
        '--use-ssl' => nil,
        '--use-os-filter' => nil,
        '--module-filter' => 'exploit/blah1,exploit/blah2',
        '--report-type' => 'fisma',
        '--workspace-name' => 'some-workspace',
        '--nexpose-console-name' => 'some-console',
        '--device-ip-to-scan' => '1.2.3.4',
        '--whitelist-hosts' => '1.2.3.0/24',
      }

      @command_line_argument_parser = CommandLineArgumentParser.parse(hash_to_array(@expected_arguments))
    end

    it 'should parse --connection-url' do
      expect(@command_line_argument_parser['connection_url']).to eq(@expected_arguments['--connection-url'])
    end

    it 'should parse --port' do
      expect(@command_line_argument_parser['port']).to eq(@expected_arguments['--port'])
    end

    it 'should parse --token' do
      expect(@command_line_argument_parser['token']).to eq(@expected_arguments['--token'])
    end

    it 'should parse --use-ssl' do
      expect(@command_line_argument_parser['use_ssl']).to eq(true)
    end

    it 'should pick appropriate default when --use-ssl not present' do
      @expected_arguments.delete '--use-ssl'
      @command_line_argument_parser = CommandLineArgumentParser.parse(hash_to_array(@expected_arguments))
      expect(@command_line_argument_parser['use_ssl']).to eq(false)
    end

    it 'should parse --use-os-filter' do
      expect(@command_line_argument_parser['use_os_filter']).to eq(true)
    end

    it 'should pick appropriate default when --use-os-filter not present' do
      @expected_arguments.delete '--use-os-filter'
      @command_line_argument_parser = CommandLineArgumentParser.parse(hash_to_array(@expected_arguments))
      expect(@command_line_argument_parser['use_os_filter']).to eq(false)
    end

    it 'should parse --module-filter' do
      expect(@command_line_argument_parser['module_filter']).to eq(@expected_arguments['--module-filter'])
    end

    it 'should parse --report-type' do
      expect(@command_line_argument_parser['report_type']).to eq(@expected_arguments['--report-type'].to_sym)
    end

    it 'should parse --workspace-name' do
      expect(@command_line_argument_parser['workspace_name']).to eq(@expected_arguments['--workspace-name'])
    end

    it 'should parse --nexpose-console-name' do
      expect(@command_line_argument_parser['nexpose_console_name']).to eq(@expected_arguments['--nexpose-console-name'])
    end

    it 'should parse --device-ip-to-scan' do
      expect(@command_line_argument_parser['device_ip_to_scan']).to eq(@expected_arguments['--device-ip-to-scan'])
    end

    it 'should parse --whitelist-hosts' do
      expect(@command_line_argument_parser['whitelist_hosts']).to eq(@expected_arguments['--whitelist-hosts'])
    end
  end

  def hash_to_array(hash)
    hash.map { |key, value| [key, value] }.flatten.select { |val| !val.nil? }
  end
end
