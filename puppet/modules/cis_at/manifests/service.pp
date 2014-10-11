class cis_at::service inherits cis_at {
  
  if ! ($service_ensure in [ 'running', 'stopped' ]){
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_manage == true {
    service { 'at':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hastatus   => true,
      harestart  => true,
    }
  }
}
