# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libaccounts-qt
pkgdesc='Qt-based client library for accessing the online accounts database'
pkgver=1.17
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gitlab.com/accounts-sso/libaccounts-qt'
license=(LGPL-2.1-or-later)
depends=(glib2
         libaccounts-glib
         qt6-base)
checkdepends=(dbus)
source=(https://gitlab.com/accounts-sso/libaccounts-qt/-/archive/VERSION_$pkgver/libaccounts-qt-VERSION_$pkgver.tar.gz)
sha256sums=('6ed3e976133962c1c88f6c66928ba0d0a17a570843577d31e783dc891659e5d8')

build() {
  local lto=()
  check_option lto y && lto=(-config ltcg)

  cd "$pkgname-VERSION_$pkgver"
  qmake6 PREFIX=/usr LIBDIR=/usr/lib "${lto[@]}"
  make
}

check() {
  cd "$pkgname-VERSION_$pkgver"
  dbus-run-session make -C tests check
}

package() {
  cd "$pkgname-VERSION_$pkgver"
  make -C Accounts INSTALL_ROOT="$pkgdir" install
  _install_license_ COPYING
}
