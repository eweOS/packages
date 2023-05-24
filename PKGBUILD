# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libbsd
pkgver=0.11.7
pkgrel=3
pkgdesc='commonly-used BSD functions not implemented by all libcs'
arch=(x86_64 aarch64)
url="https://libbsd.freedesktop.org"
license=('custom')
depends=('musl' 'libmd')
options=('staticlibs')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha512sums=('51fda4724f41dd8a4628afd58c21236a7588d9045e337e06eeabf83805a9aaaa53705441ca901ad11f1c65f18e881523bdc97721a7d3d6a5cced27f2450d09a2')

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
