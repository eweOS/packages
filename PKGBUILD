# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.18.1
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('x86_64')
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

