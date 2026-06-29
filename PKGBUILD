# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Alex Chamberlain <alex at alexchamberlain dot co dot uk>
# Contributor: Kars Wang <jaklsy at gmail dot com>

pkgname=jq
pkgver=1.8.2
pkgrel=1
pkgdesc='Command-line JSON processor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://stedolan.github.io/jq/'
license=('MIT')
depends=('musl' 'oniguruma')
# tzdata is required for timezone-related formatting tests
makedepends=('python' 'tzdata')
# 0001: Downstream, workaround -e flag that isn't supported by busybox "script"
# 0002: Backport, drop non-portable %F flags to fix testsuite on musl
#	3c5ceac ("jq.test: drop non-portable %F test")
source=("https://github.com/stedolan/jq/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"0001-tests-shtest-Workaround-busybox-s-script-implementat.patch"
	"0002-jq-test-drop-non-portable-F-test.patch")
sha512sums=('d4058940cff1cd9946d7f2a9057316bf05915679385386685d140b7a82d870d43ae5b5b4d0a5560c864cf0ef2cc59d7b6ed3afb46b3aea0f4d35329678b2c328'
            '144d2309bfcd5191c9621e6c69d16b71f2016cac09ee1375005cd20273324863143fd132740be387873c01ad6cd1865d9e90d5e8e430b25c045fce16f68a4951'
            '0cc1f912b4b0cdf5ed72f5632b8279f44da58a92e58d99f38321f7aaab16f04f344b657d9b844255ee9a5c89fc784772e41a94139178b0e1cc3c7bb06f34f1ec')

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
