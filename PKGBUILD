# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=c-ares
pkgver=1.32.3
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64 aarch64 riscv64)
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('5c64cf308f618e70efc69df22b1610efd4633b9e2e81c61cd1fa04bfa6f90f1cb23657a289214be57ac1ed95e17fab6765a32a2a4fed3b758cfdf5295dac2164')

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
