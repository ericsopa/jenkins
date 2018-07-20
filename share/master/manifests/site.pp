node 'agent.localdomain' {

  include jenkins

  file { '/etc/puppet/modules/jenkins/manifests/init.pp':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/jenkins/init.pp',
  }
}
