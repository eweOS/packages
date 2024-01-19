# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libbsd
pkgver=0.11.8
pkgrel=1
pkgdesc='commonly-used BSD functions not implemented by all libcs'
arch=(x86_64 aarch64 riscv64)
url="https://libbsd.freedesktop.org"
license=('custom')
depends=('musl' 'libmd')
options=('staticlibs')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha512sums=('0173fc20e2471f96bc6677500a02fbccef7463e023445f47681843c9a94b1fa9970c5af7d2f87f1a1e7f8a7bb60112988defc073828fd2a0dcd0e66e44e67295')

prepare()
{
  cd "$pkgname-$pkgver"
  # nlist failed, no solutions found
  sed -i 's/nlist//' test/Makefile.am
  ./autogen
}

build()
{
  cd "$pkgname-$pkgver"
  # Fix for musl 1.2.4
  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$pkgname-$pkgver"
  make check
}

package()
{
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  rm "${pkgdir}"/usr/lib/libbsd.a
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -f "${pkgdir}"/usr/share/man/man3/explicit_bzero.3
}
