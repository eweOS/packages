# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=md4c
pkgver=0.4.8
pkgrel=1
pkgdesc='C Markdown parser'
arch=(x86_64 aarch64)
url='https://github.com/mity/md4c'
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mity/md4c/archive/release-$pkgver.tar.gz")
sha256sums=('SKIP')

build()
{
  cmake -B build -S $pkgname-release-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-release-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
