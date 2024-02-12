# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=md4c
pkgver=0.5.2
pkgrel=1
pkgdesc='C Markdown parser'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/mity/md4c'
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mity/md4c/archive/release-$pkgver.tar.gz")
sha256sums=('55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21')

build()
{
  cmake -B build -S $pkgname-release-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-release-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
