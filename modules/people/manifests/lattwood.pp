# == Class: people::lattwood
#
#
# === Authors
#
# Me <logan@therounds.ca>
#
# === Copyright
#
# Copyright 2014 Me
#
class people::lattwood() {

  osx::recovery_message { 'If this Mac is found, please call 902 449 7121': }

  include osx::global::enable_standard_function_keys
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click

  include osx::dock::autohide

  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files

  include osx::universal_access::ctrl_mod_zoom
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control
  include osx::software_update

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'osx::sound::interface_sound_effects':
    enable => false
  }

  include git

  git::config::global { 'user.email':
    value => 'logan@therounds.ca'
  }

  include zsh
  include ::iterm2::stable
  include dash

  $packages = [
    'nmap',
    'reattach-to-user-namespace',
    'source-highlight',
    'the_silver_searcher',
    'tmux',
    'tig',
    'zsh-completions',
    'zsh-history-substring-search',
    'zsh-syntax-highlighting',
    'vim'
  ]

  package { $packages:
    ensure  => latest
  }
}

