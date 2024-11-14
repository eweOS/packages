# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=c-ares
pkgver=1.34.3
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('musl')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('bafe97923a316bb4c33f616448faa04b938f46336cdf26a38ab619faeabcaa88f285e645f4309b928995008e9a0ede232609d58ee344a1729a9e29a9cbe4d94c')

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
