# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.24.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64 aarch64 riscv64)
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-/}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3701853e263de94daf19734185ad913848c19b825e0738926b418a54b0628ee1ac95a49ebfaa2ddf3eed74a7ef209e1a0a8f573df3e507ef1f11fcc53fc5eb68')

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
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
