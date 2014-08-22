# MetasploitPenTestScript

This is a ruby gem that basically wraps the msfrpc-client gem. 

It was primarily created to automate workspace creation and automatic import of nexpose scan data from use in 
a Jenkins automated CI/CD environment. 

Basically this allows you to attach metasploit to your Continuous Delivery/Continuous integration pipeline. 
Though it can be used for other purposes.

## Installation

Add this line to your application's Gemfile:

    gem 'metasploit-runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metasploit-runner

## Usage

This gem allows you to specify the Metasploit Connection URL, Metasploit Connection Port, Metasploit URI, SSL TRUE/False, Token, Workspace Name, Nexpose Console Name, Device/Target IP.

$ exploit "connection_url" "port" "uri" "use_ssl" "token" "workspace_name" "nexpose_console_name" "device_ip_to_scan"

Example:

$ exploit "sploit.mydomain.com" "3790" "/api/1.0" "true" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "nexpose-console-1" "10.0.0.1"

The if you do not pass the following options they will default to the respective values:

port -> 3790
uri -> /api/1.0
use_ssl -> true

Example using the defaults:

$ exploit "sploit.mydomain.com" "" "" "" "asdlkjhsdfuw1228340asdasf8" "mycoolsoftware-build-28" "nexpose-console-1" "10.0.0.1"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/MetasploitPenTestScript/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
