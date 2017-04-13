node 'puppet-node1' {
  class { '::mysql::server':
    root_password => 'root123',
  }


  mysql_database { 'test_mdb':
    ensure  =>  present,
    charset =>  'utf8',
  }


  mysql_user { 'admin@localhost':
    ensure  =>  present,
    password_hash =>  mysql_password('qwe123'),
  }


  mysql_grant { 'admin@localhost/test_mdb.*':
    ensure  =>  present,
    options =>  ['GRANT'],
    privileges  =>  ['ALL'],
    table =>  'test_mdb.*',
    user  =>  'admin@localhost',
  }

}
