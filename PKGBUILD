# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oed
pkgver=7.4
pkgrel=1
pkgdesc="Portable version of the OpenBSD ed text editor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/ibara/oed"
license=('BSD' 'ISC')
depends=('musl')
source=("https://github.com/ibara/oed/archive/refs/tags/oed-${pkgver}.tar.gz")
sha512sums=('1abb5bacf7a0b7485b27e94bf713af3afb536d7ff8d10eb6d786b0f004deb8c8e9932e4fc72d4e8076787e55bf6aab64d661437ed5e39c3bfc7f6a91dadfe6d6')

build()
{
  cd $pkgname-$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --program-name=$pkgname
  make
}

package()
{
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
