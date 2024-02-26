# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.27.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64 aarch64 riscv64)
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-/}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d0bffeeabdc5f1d4cececd46bd495b8224a64eaaf6d2a91c5475517440effe0e096146a1ebf19ece07367198be576c61b11961d5e4c3f601c5c5529ce4fcb46a')

build()
{
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev \
    -B build \
    -S .
  make VERBOSE=1 -C build
}

check() {
  cd $pkgname-$pkgver
  # no test found
  ctest --test-dir build --output-on-failure
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README,RELEASE-NOTES}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
