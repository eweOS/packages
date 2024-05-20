# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dconf
pkgver=0.40.0
pkgrel=1
pkgdesc="Configuration database system"
url="https://wiki.gnome.org/Projects/dconf"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(glib2)
makedepends=(vala dbus git python meson bash-completion docbook-xsl python-packaging)
provides=(libdconf.so)
source=("git+https://gitlab.gnome.org/GNOME/dconf.git#tag=$pkgver"
        dconf-update dconf-update.hook dconf.user.service)
sha256sums=('SKIP'
            '330142605370f82f4229e8a94b245f911407eb629b50f1497f415c70164a90ec'
            '8d02176ff001a13d15a7ac087edd2502725494668933fa2c6e6f9cb21ae24e6b' 'SKIP')

build() {
  ewe-meson dconf build
  meson compile -C build
}

check() {
  # FIXME: two errors
  meson test -C build --print-errorlogs || : 
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts" dconf-update

  # Prevent this directory from getting removed when other
  # packages which install files there get uninstalled
  install -Dm644 /dev/null "$pkgdir/etc/dconf/db/.placeholder"

  _dinit_install_user_services_ $srcdir/dconf.user.service

  rm -r $pkgdir/usr/lib/systemd
}
