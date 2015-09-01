# MetasploitPenTestScript

This is a ruby gem that basically wraps the msfrpc-client gem.

It was primarily created to automate workspace creation and automatic import of Nexpose scan data from use in
a Jenkins automated CI/CD environment.

Basically this allows you to attach Metasploit to your Continuous Delivery/Continuous Integration pipeline, though it can be used for other purposes.

## Installation

Add this line to your application's Gemfile:

    gem 'metasploit-runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metasploit-runner

## Usage

This gem allows you to specify the Metasploit Connection URL, Metasploit Connection Port, Metasploit URI, SSL true/false, Token, Workspace Name, Nexpose Console Name, Device/Target IP, Exploit Module OS Filter, report type, and Whitelist CIDR block for exploits..

The nexpose_console_name is optional, if you specify a Nexpose console name it will use the workspace_name, and Nexpose console name to pull scan data from a Nexpose console.
IMPORTANT: Your "Site Name" in Nexpose, must match your "Workspace" name in Metasploit and you must add your Nexpose Console to Metasploit for this to work properly.

    $ exploit "connection_url" "port" "uri" "use_ssl" "token" "workspace_name" "nexpose_console_name" "device_ip_to_scan" "os_filter" "module_filter" "report_type" "whitelist_hosts"

Example WITH Nexpose Console Integration:

    $ exploit "sploit.mydomain.com" "3790" "/api/1.0" "<true/false>" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "nexpose-console-1" "10.0.0.1" "<true/false>" "exploit/windows/smb/psexec" "fisma" "10.0.0.0/8"

Example WITHOUT Nexpose Console Integration:

    $ exploit "sploit.mydomain.com" "3790" "/api/1.0" "true" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "" "10.0.0.1" "false" "exploit/windows/smb/psexec" "fisma" "10.0.0.0/8"

Additionally, an OS filter may be passed in to determine which modules will be ran during an exploit.  The os filter parameter will default to false (all modules will run) if you do not pass a value.

    Note: at the time of publishing this version of the gem, that was over 6,000 modules, which is A LOT. This option will only work of metasploit has a high confidence in your O/S type.

Example WITH OS Filter:

    $ exploit "sploit.mydomain.com" "3790" "/api/1.0" "true" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "nexpose-console-1" "10.0.0.1" "true" "" "fisma" "10.0.0.0/8"

The if you do not pass the following options they will default to the respective values:

       port -> 3790
       uri -> /api/1.0
       use_ssl -> true
       os_filter -> false

Example using the defaults:

    $ exploit "sploit.mydomain.com" "" "" "" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "nexpose-console-1" "10.0.0.1" "" "" "" "10.0.0.0/8"

It is possible to use a YAML file to drive the configuration of this module.  An example YAML file is included in config/exploit.yml.example.  Simply copy it to config/exploit.yml and modify it to work with your environment.

## Contributing

1. Fork it ( https://github.com/amngibson/metasploit-runner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
