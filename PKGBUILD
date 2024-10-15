# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=networkmanager
pkgname=(
  networkmanager
  libnm
  nm-cloud-setup
  networkmanager-docs
)
pkgver=1.48.10
pkgrel=1
pkgdesc="Network connection manager and user applications"
url="https://networkmanager.dev/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
makedepends=(
  bash
  curl
  git
  glib2
  gobject-introspection
  gtk-doc
  jansson
  libndp
  libnewt
  libpsl
  libudev
  linux-headers
  meson
  nftables
  nspr
  nss
  python-gobject
  readline
  vala
  wpa_supplicant
)
checkdepends=(
  python-dbus
)
source=(
  "NetworkManager-$pkgver::https://github.com/NetworkManager/NetworkManager/archive/refs/tags/$pkgver.tar.gz"
  lto-no-gcc.patch
  fix-libsystemdless-build.patch
  networkmanager.service
  force-platform-init.patch
)
sha256sums=('53f3b8e3af81a244591327e2fb30e9018d3e7f90ad2c5879add475eefd786edf'
            'b23385bcadc7a24de4cfba4a3cd299992ed8d77ef5e74a634942282ab0383219'
            '0040b517d07ad5edc55f403c0b649b6ac018d1e2ffaf318863d8d74c7842cdcd'
            '0d6284910b53312082c7624dde57ad88d8ff9c46faaeb4d7540276dc44176723'
            '412487dc91184526523915a5399dd78feadd146462c790ec0fa47151c4b963a4')

prepare() {
  _patch_ NetworkManager-$pkgver
}

build() {
  local _false_comps=(iwd systemd_journal ifupdown modem_manager ppp polkit)
  local _no_comps=(libaudit session_tracking dhcpcd dhclient systemdsystemunitdir)
  
  local meson_options=(
    # build checks this option; injecting just via *FLAGS is broken
    -D b_lto=true

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D modify_system=true
    -D selinux=false

    # configuration plugins
    -D config_plugins_default=keyfile

    # handlers for resolv.conf
    -D netconfig=no
    -D config_dns_rc_manager_default=symlink

    # miscellaneous
    -D vapi=true
    -D docs=true
    -D more_asserts=no
    -D more_logging=false
    -D qt=false
  )

  for _false_comp in "${_false_comps[@]}"; do
    meson_options+=(-D ${_false_comp}=false)
  done
  
  for _no_comp in "${_no_comps[@]}"; do
    meson_options+=(-D ${_no_comp}="no")
  done

  ewe-meson NetworkManager-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # build with lto on and debug on causes failure for test check-local-exports-libnm
  test_list=$(meson test -C build --list) 2> /dev/null
  test_list=${test_list//check-local-exports-libnm}
  NMTST_FORCE_REAL_ROOT=1 meson test -C build --print-errorlogs $test_list
}

package_networkmanager() {
  depends=(
    curl
    glib2
    jansson
    libndp
    libnewt
    libnm
    libpsl
    libudev
    mobile-broadband-provider-info
    nspr
    nss
    readline
    wpa_supplicant
  )
  optdepends=(
    'bluez: Bluetooth support'
    'dhclient: alternative DHCP client'
    'dhcpcd: alternative DHCP client'
    'dnsmasq: connection sharing'
    'firewalld: firewall support'
    'iptables: connection sharing'
    'iwd: wpa_supplicant alternative'
    'modemmanager: cellular network support'
    'nftables: connection sharing'
    'openresolv: alternative resolv.conf manager'
    'pacrunner: PAC proxy support'
    'polkit: let non-root users control networking'
    'ppp: dialup connection support'
  )
  backup=(etc/NetworkManager/NetworkManager.conf)

  # NM wants to move to LGPL only, but there's still GPL code left
  license+=(GPL-2.0-or-later)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  # /etc/NetworkManager
  install -d etc/NetworkManager/{conf,dnsmasq}.d
  install -dm700 etc/NetworkManager/system-connections
  install -m644 /dev/stdin etc/NetworkManager/NetworkManager.conf <<END
# Configuration file for NetworkManager.
# See "man 5 NetworkManager.conf" for details.
END

  # packaged configuration
  install -Dm644 /dev/stdin usr/lib/NetworkManager/conf.d/20-connectivity.conf <<END
[connectivity]
uri=http://ping.archlinux.org/nm-check.txt
END

  shopt -s globstar

  _pick_ docs usr/share/gtk-doc

  _pick_ libnm usr/include/libnm
  _pick_ libnm usr/lib/girepository-1.0/NM-*
  _pick_ libnm usr/lib/libnm.*
  _pick_ libnm usr/lib/pkgconfig/libnm.pc
  _pick_ libnm usr/share/gir-1.0/NM-*
  _pick_ libnm usr/share/vala/vapi/libnm.*

  _pick_ cloud usr/lib/**/*nm-cloud-setup*
  _pick_ cloud usr/share/man/*/nm-cloud-setup*

  # Restore empty dir
  install -d usr/lib/NetworkManager/dispatcher.d/no-wait.d
  
  _dinit_install_services_ $srcdir/networkmanager.service
}

package_libnm() {
  pkgdesc="NetworkManager client library"
  depends=(
    glib2
    nspr
    nss
    util-linux-libs
  )
  provides=(libnm.so)

  mv pkgs/libnm/* "$pkgdir"
}

package_nm-cloud-setup() {
  pkgdesc="Automatically configure NetworkManager in cloud"
  depends=(
    bash
    curl
    glib2
    libnm
    networkmanager
  )

  mv pkgs/cloud/* "$pkgdir"
}

package_networkmanager-docs() {
  pkgdesc+=" (API documentation)"
  depends=()

  mv pkgs/docs/* "$pkgdir"
}
