
include_attribute "sudo"
default['authorization']['sudo']['groups']            = ["admin", "sudo"]
default['authorization']['sudo']['users']             = []
default['authorization']['sudo']['passwordless']      = true
default['authorization']['sudo']['include_sudoers_d'] = true
default['authorization']['sudo']['agent_forwarding']  = false # we got this covered with "env_keep += SSH_AUTH_SOCK SSH_AGENT_PID" below
default['authorization']['sudo']['sudoers_defaults']  = [
  'env_reset',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"',
  'env_keep += "SSH_AUTH_SOCK SSH_AGENT_PID"',  # ssh agent forwarding
  'env_keep += "GIT_EDITOR GIT_AUTHOR_NAME GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_AUTHOR_EMAIL"'
]


include_attribute "openssh"
default['openssh']['server']["Port"] = 22
default['openssh']['server']["Protocol"] = 2
default['openssh']['server']["listen_address"] = ["0.0.0.0", "::"]
default['openssh']['server']["HostKey"] = ["/etc/ssh/ssh_host_rsa_key", "/etc/ssh/ssh_host_dsa_key", "/etc/ssh/ssh_host_ecdsa_key"]
default['openssh']['server']["UsePrivilegeSeparation"] = "yes"
default['openssh']['server']["KeyRegenerationInterval"] = 3600
default['openssh']['server']["ServerKeyBits"] = 768
default['openssh']['server']["SyslogFacility"] = "AUTH"
default['openssh']['server']["LogLevel"] = "INFO"
default['openssh']['server']["LoginGraceTime"] = 120
default['openssh']['server']["PermitRootLogin"] = "yes"
default['openssh']['server']["StrictModes"] = "yes"
default['openssh']['server']["RSAAuthentication"] = "yes"
default['openssh']['server']["PubkeyAuthentication"] = "yes"
default['openssh']['server']["IgnoreRhosts"] = "yes"
default['openssh']['server']["RhostsRSAAuthentication"] = "no"
default['openssh']['server']["HostbasedAuthentication"] = "no"
default['openssh']['server']["PermitEmptyPasswords"] = "no"
default['openssh']['server']["ChallengeResponseAuthentication"] = "no"
default['openssh']['server']["X11Forwarding"] = "yes"
default['openssh']['server']["X11DisplayOffset"] = 10
default['openssh']['server']["PrintMotd"] = "no"
default['openssh']['server']["PrintLastLog"] = "yes"
default['openssh']['server']["TCPKeepAlive"] = "yes"
default['openssh']['server']["AcceptEnv"] = ["LANG", "LC_*", "GIT_*"]
default['openssh']['server']["Subsystem"] = "sftp /usr/lib/openssh/sftp-server"
default['openssh']['server']["UsePAM"] = "yes"
default['openssh']['server']["UseDNS"] = "no"
