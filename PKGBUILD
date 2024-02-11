# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Roman G <drakosha@au.ru>

pkgname=axel
pkgver=2.17.13
pkgrel=1
pkgdesc="Light command line download accelerator"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/axel-download-accelerator/axel"
license=('GPL')
depends=('musl' 'openssl')
source=(https://github.com/axel-download-accelerator/axel/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('6af9c0238ca4fb850baa17878de0361868e3ff6d9302298d83c6d26931c28723')

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
