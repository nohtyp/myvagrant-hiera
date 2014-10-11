class cis_passwd_files::params {

$file_present = 'present'

case $::osfamily {
           'RedHat': {
              $plain_text      = ['/etc/passwd', '/etc/group']
              $encrypted_text  = ['/etc/shadow', '/etc/gshadow']
            }
            default: {
                   fail("This module ${module_name} is not supported on a ${::osfamily} based system")
                }
     }

}
