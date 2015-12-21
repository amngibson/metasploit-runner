require 'optparse'

class CommandLineArgumentParser
  def self.parse(args)
    options = {}
    options['use_ssl'] = false
    options['use_os_filter'] = false
    options['exploit_speed'] = 5
    options['limit_sessions'] = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: exploit [options]'

      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('--port PORT', 'Metasploit port') do |port|
        options['port'] = port
      end

      opts.on('--connection-url URL', 'Metasploit URL') do |url|
        options['connection_url'] = url
      end

      opts.on('--use-ssl', 'Use SSL when scanning') do
        options['use_ssl'] = true
      end

      opts.on('--token TOKEN', 'Access token for Metasploit') do |token|
        options['token'] = token
      end

      opts.on('--workspace-name NAME', 'Name of workspace') do |workspace|
        options['workspace_name'] = workspace
      end

      opts.on('--nexpose-console-name NAME', 'Name of Nexpose console') do |console|
        options['nexpose_console_name'] = console
      end

      opts.on('--device-ip-to-scan IP-ADDRESS', 'IP address of device to scan') do |ip|
        options['device_ip_to_scan'] = ip
      end

      opts.on('--use-os-filter', 'Use OS filter') do
        options['use_os_filter'] = true
      end

      opts.on('--module-filter MODULES', 'Comma-separated list of modules to use in scan') do |modules|
        options['module_filter'] = modules
      end

      opts.on('--report-type TYPE', 'Type of report to generate') do |type|
        options['report_type'] = type.to_sym
      end

      opts.on('--whitelist-hosts HOSTS', 'IP addresses or CIDR blocks to scan') do |whitelist|
        options['whitelist_hosts'] = whitelist
      end

      opts.on('--exploit-speed SPEED', 'Exploit speed') do |speed|
        options['exploit_speed'] = speed
      end

      opts.on('--limit-sessions', 'Limit sessions') do
        options['limit_sessions'] = true
      end
    end

    opt_parser.parse!(args)
    options
  end
end
