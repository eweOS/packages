# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libbsd
pkgver=0.12.2
pkgrel=1
pkgdesc='commonly-used BSD functions not implemented by all libcs'
arch=(x86_64 aarch64 riscv64)
url="https://libbsd.freedesktop.org"
license=('custom')
depends=('musl' 'libmd')
options=('staticlibs')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha512sums=('ce43e4f0486d5f00d4a8119ee863eaaa2f968cae4aa3d622976bb31ad601dfc565afacef7ebade5eba33fff1c329b5296c6387c008d1e1805d878431038f8b21')

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
