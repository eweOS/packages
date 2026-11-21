# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libaccounts-glib
pkgver=1.27
pkgrel=1
pkgdesc='Glib-based client library for accessing the online accounts database'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gitlab.com/accounts-sso/libaccounts-glib'
license=(LGPL-2.1-or-later)
depends=(glib2
         libxml2
         sqlite)
makedepends=(check
             gtk-doc
             gobject-introspection
             meson
             python-gobject
             python-packaging
             vala)
checkdepends=(dbus)
source=(https://gitlab.com/accounts-sso/libaccounts-glib/-/archive/VERSION_$pkgver/libaccounts-glib-VERSION_$pkgver.tar.gz)
sha256sums=('a8407a5897a2e425ea1aa955ecf88485dd2fd417919de275b27c781a5d0637a5')

build() {
  meson $pkgname-VERSION_$pkgver build \
    -Dprefix=/usr
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
