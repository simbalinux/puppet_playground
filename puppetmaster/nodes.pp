node 'agent1' {
  $wikisitename = 'wiki'
  $wikimetanamespace = 'Wiki'
  $wikiserver = "http://192.168.1.5:8080"
  $wikidbserver = 'localhost'
  $wikidbname = 'wiki'
  $wikidbuser = 'root'
  $wikidbpassword = 'training'
  $wikiupgradekey = 'puppet'

  class { 'linux': }
  class { 'mediawiki': }
}
node 'agent2' {
  class { 'linux': }
  class { 'mediawiki': }
}
# default linux class for basic tools
class linux {
  
  $admintools = ['git','nano','screen']

  package { $admintools:
    ensure => 'installed',
  }

  $ntpservice = $osfamily ? {
  'redhat' => 'ntpd',
  'debian' => 'ntp',
   default => 'ntp',
  }
  file { '/info.txt':
    ensure => 'present',
    content => inline_template("Created by Puppet at <%= Time.now %>\n"),
  }
 package { 'ntp':
    ensure => 'installed',
  }
  service { $ntpservice:
    ensure => 'running',
    enable => 'true'
  }

}
