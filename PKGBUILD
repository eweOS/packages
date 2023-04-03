# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fswatch
pkgver=1.17.1
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends"
arch=(x86_64 aarch64)
url="https://emcrisostomo.github.io/fswatch/"
license=('GPL')
depends=('llvm-libs')
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c38e341c567f5f16bfa64b72fc48bba5e93873d8572522e670e6f320bbc2122f')

build()
{
  cd "$pkgname-$pkgver"

  # maybe change to cmake in future
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$pkgname-$pkgver"
  make -k check
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
