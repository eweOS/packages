# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fswatch
pkgver=1.18.3
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://emcrisostomo.github.io/fswatch/"
license=('GPL')
depends=('llvm-libs')
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('08b13c0e0f92bd5eee5a310bb58fc373f0cda8304f9decc34cfabc42adf8e9ca')

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
