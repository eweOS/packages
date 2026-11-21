# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=signond
pkgver=8.61
pkgrel=1
pkgdesc='A D-Bus service which performs user authentication on behalf of its clients'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gitlab.com/accounts-sso/signond/'
license=(LGPL-2.1-or-later)
depends=(qt6-base)
backup=(etc/signond.conf)
# 0001: Downstream, Qt 6 support from upstream MR !36; drop when merged
# https://gitlab.com/accounts-sso/signond/-/merge_requests/36
# 0002: Downstream, skip API documentation generation
source=("$pkgname-VERSION_$pkgver.tar.bz2::https://gitlab.com/accounts-sso/signond/-/archive/VERSION_$pkgver/$pkgname-VERSION_$pkgver.tar.bz2"
        "0001-qt6-support.patch"
        "0002-skip-api-docs.patch")
sha256sums=('5d9f29fbf5892d01e38ce931b9a69c4bb08e6788f6cbdc80c277f4723b44249d'
            'bd51be25b66991f532772a83f4fce1b2c5fbbe199c289ef55d4cce9a80d75c23'
            'd266ed42a03ae210ce6698331ddd5fb93dc3135c8d4cbb1c44a056768e655d49')

prepare() {
  _patch_ "$pkgname-VERSION_$pkgver"
}

build() {
  local lto=()
  check_option lto y && lto=(-config ltcg)

  cd "$pkgname-VERSION_$pkgver"
  qmake6 PREFIX=/usr LIBDIR=/usr/lib "${lto[@]}"
  make
}

check() {
  cd "$pkgname-VERSION_$pkgver"
  dbus-run-session make check
}

package() {
  cd "$pkgname-VERSION_$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  _install_license_ COPYING
}
