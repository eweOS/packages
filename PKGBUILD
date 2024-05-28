# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=axel
pkgver=2.17.14
pkgrel=2
pkgdesc="Light command line download accelerator"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/axel-download-accelerator/axel"
license=('GPL')
depends=('musl' 'openssl')
source=(https://github.com/axel-download-accelerator/axel/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('938ee7c8c478bf6fcc82359bbf9576f298033e8b13908e53e3ea9c45c1443693')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
