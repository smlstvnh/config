# Class: openstack_project::params
#
# This class holds parameters that need to be
# accessed by other classes.
class openstack_project::params {
  case $::osfamily {
    'Redhat': {
      $packages = ['puppet', 'python-setuptools', 'wget']
      $user_packages = ['byobu', 'emacs-nox']
      $update_pkg_list_cmd = ''
    }
    'Debian', 'Ubuntu': {
      $packages = ['puppet', 'python-setuptools', 'wget']
      $user_packages = ['byobu', 'emacs23-nox']
      $update_pkg_list_cmd = 'apt-get update >/dev/null 2>&1;'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} The 'openstack_project' module only supports osfamily Ubuntu or Redhat(slaves only).")
    }
  }
}