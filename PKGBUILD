# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=c-ares
pkgver=1.34.4
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('7bd4ca8f1a1b6d7b6662c724315bb5d4ca1d3c19e5ff4e06e3567ea25d5f8fd60f9c5f9ade055f08dc7fc3dec0e40e96f8284207b3e03c0975fd962d4a9fcb47')

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
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README,RELEASE-NOTES}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
