require 'net/ssh'
require 'net/scp'
require 'socket'

files = Net::SSH::Config.default_files

def exec_with_exit(cmd)
  exit_code = nil
  Net::SSH.start('172.16.185.176', 'vagrant', keys: ["/Users/robertschulze/.vagrant.d/insecure_private_key"], port: 22, forward_agent: true, config: true, :send_env => ["LSCOLORS"] ) do |session|
    session.open_channel do |channel|

      #ENV.find_all {|k, v| k =~ /^GIT_/}.each { |k, v| channel.env k, v }
      channel.request_pty

      channel.exec(cmd) do |ch, success|

        channel.on_data do |ch, data|
          puts data
        end

        channel.on_extended_data do |ch, type, data|
          puts data
        end

        channel.on_request("exit-status") do |ch, data|
          exit_code = data.read_long
        end
      end
    end
    session.loop
    exit_code
  end
end

# exec_with_exit "export"
exec_with_exit 'echo "$GIT_COMMITTER_EMAIL"  "$GIT_COMMITTER_NAME" "$GIT_AUTHOR_EMAIL" "$GIT_AUTHOR_NAME" "$LSCOLORS"'
# exec_with_exit "ssh -o StrictHostKeyChecking=no git@github.com"
# exec_with_exit "sudo -E ssh -o StrictHostKeyChecking=no git@github.com"
