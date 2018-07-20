node 'agent.localdomain' {

  include jenkins

  file { '/etc/sysconfig/jenkins':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet://modules/sysconfig/jenkins',
  }
}
