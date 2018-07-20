node agent {

  include jenkins

  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }

  tomcat::install { '/opt/tomcat':
    source_url => 'https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M1/bin/apache-tomcat-9.0.0.M1.tar.gz'
  }

  tomcat::instance { 'default':
     catalina_home => '/opt/tomcat',
  }
}
