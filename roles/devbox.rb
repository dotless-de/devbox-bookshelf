name "devbox"
description "Installes basics for a ruby devbox"
run_list "recipe[devbox]",
         "recipe[devbox::nfs_server]"
         "recipe[devbox::nodejs]",
         "recipe[devbox::ruby]",
         "recipe[devbox::imagemagick]",
         "recipe[devbox::lib_qt_webkit]",
         "recipe[devbox::postgresql_server]"


override_attributes({
  "locale" => {
    'lang'     => 'en_US.utf8',
    'language' => 'en_US:de_DE:',
  }
  "devbox" => {
    'rubies' => [
      'ruby 2.0.0-p247',
    ]
  },
  "postgresql" => {
    "version" => "9.2",
  },
})
