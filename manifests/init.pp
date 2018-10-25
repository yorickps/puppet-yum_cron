# == Class: yum_cron: See README.md for documentation
class yum_cron (
  #$randomwait = fqdn_rand(30)
  $hostname,
  Boolean $package_manage,
  Boolean $service_manage,
  Enum['yes','no'] $apply_updates,
  Enum['yes','no'] $download_updates,
  Enum['yes','no'] $update_messages,
  Hash $extra_configs,
  Integer $output_width,
  Integer $random_sleep,
  Optional[Boolean] $service_enable,
  Optional[Enum['undef', 'UNSET', 'absent', 'disabled']] $yum_autoupdate_ensure,
  Optional[Enum['yes','no']] $check_first,
  Optional[Enum['yes','no']] $check_only,
  Optional[Enum['yes','no']] $service_waits,
  Optional[Integer] $random_sleep_hourly,
  Optional[Integer] $service_wait_time,
  Optional[Pattern[/^[0-6]$/]] $cleanday,
  Optional[Pattern[/^[0-9]+$/]] $error_level,
  Optional[String] $package_ensure,
  Optional[String] $service_ensure,
  Optional[String] $service_provider,
  Pattern[/^(?:-)?[0-9]$/] $debug_level,
  Pattern[/^[0-6]+$/] $days_of_week,
  Pattern[/^[0-9]+$/] $randomwait,
  Stdlib::Absolutepath $config,
  Stdlib::Absolutepath $config_yum_hourly,
  Stdlib::Absolutepath $config_cron_hourly,
  String $email_from,
  String $email_host,
  String $email_to,
  String $emit_via,
  String $mailto,
  String $package_name,
  String $service_name,
  String $systemname,
  String $update_cmd,
){

  contain yum_cron::install
  contain yum_cron::config
  contain yum_cron::service

  Class['::yum_cron::install']
  -> Class['::yum_cron::config']
  ~> Class['::yum_cron::service']
}
