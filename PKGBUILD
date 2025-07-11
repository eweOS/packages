# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Alex Chamberlain <alex at alexchamberlain dot co dot uk>
# Contributor: Kars Wang <jaklsy at gmail dot com>

pkgname=jq
pkgver=1.8.1
pkgrel=1
pkgdesc='Command-line JSON processor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://stedolan.github.io/jq/'
license=('MIT')
depends=('musl' 'oniguruma')
makedepends=('python')
# 0001: Backport, workaround GNU-specific numeric escaping sequences which
#	aren't supported by busybox sed.
# 0002: Downstream, workaround -e flag that isn't supported by busybox "script"
source=("https://github.com/stedolan/jq/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"0001-Fix-build-on-old-Macs.patch::https://github.com/jqlang/jq/commit/023f274ee9d14738ab06d674a9d6fe7725441949.patch"
	"0002-tests-shtest-Workaround-busybox-s-script-implementat.patch")
sha512sums=('b09d48dbeaac7b552397b75692ed7833afa72186de80d977fb1b887a14ac66c02f677acdd79f9a2736db1fd738b7ce57a39725e34846bfa21ed3728cd7adc187'
            '37ce482fcca1e24b01aba44108bad732038920206b7c903f9858e7b78fe05c50b1bdbbadcdb0a1b9155582cd042ccc7282bf082d243f0c743b89c78b1daba6e3'
            '144d2309bfcd5191c9621e6c69d16b71f2016cac09ee1375005cd20273324863143fd132740be387873c01ad6cd1865d9e90d5e8e430b25c045fce16f68a4951')

prepare() {
  _patch_ "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix=/usr install
  _install_license_ COPYING
}
