# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Alex Chamberlain <alex at alexchamberlain dot co dot uk>
# Contributor: Kars Wang <jaklsy at gmail dot com>

pkgname=jq
pkgver=1.8.0
pkgrel=1
pkgdesc='Command-line JSON processor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://stedolan.github.io/jq/'
license=('MIT')
depends=('musl' 'oniguruma')
makedepends=('bison' 'flex' 'python')
source=("https://github.com/stedolan/jq/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"0001-Fix-build-on-old-Macs.patch::https://github.com/jqlang/jq/commit/023f274ee9d14738ab06d674a9d6fe7725441949.patch")
sha512sums=('eaa991e43d3fc716dd57f6722a42d4119dcd8ba272eb2fcab882f83efb0b11c10a35c3dc8ad2067f30440dad988d34b5955601499eae1bb9e43db53db02bc4cf'
            '37ce482fcca1e24b01aba44108bad732038920206b7c903f9858e7b78fe05c50b1bdbbadcdb0a1b9155582cd042ccc7282bf082d243f0c743b89c78b1daba6e3')

prepare()
{
  _patch_ "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  # fix busybox script command
  sed -i 's@script -qec@script -qc@' tests/shtest
  autoreconf -fiv
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "${pkgname}-${pkgver}"
  make check
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix=/usr install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
