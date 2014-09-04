class projects::project1 () {

	include virtualbox
  include vagrant_manager

  class { '::vagrant':
    completion => true
  }

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-vbguest': }
  vagrant::plugin { 'vagrant-hostsupdater': }
  vagrant::plugin { 'vagrant-hostmanager': }
  vagrant::plugin { 'vagrant-host-shell': }

  include jq
  include chrome
  include firefox

  include github_for_mac

  include fonts
  include gimp

}

