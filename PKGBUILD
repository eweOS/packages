# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=gcompat
pkgver=1.1.0
pkgrel=1
pkgdesc="The GNU C Library compatibility layer for musl"
url="https://git.adelielinux.org/adelie/gcompat"
arch=(x86_64 aarch64 riscv64)
license=('NCSA')
depends=('libucontext' 'musl' 'musl-obstack' 'utmps')
makedepends=('musl-static')
source=("https://git.adelielinux.org/adelie/gcompat/-/archive/$pkgver/gcompat-$pkgver.tar.gz")
sha512sums=('8f27aa8d268586ecb647bc147a9d56704d087b0f3ac357c6c239958663ec9e9e428e6cfdb9a063ead5c2098444cc4a7c4567c18477309feb05ed3de01b24f9e8')
provides=('glibc')

_make_args=('WITH_LIBUCONTEXT=1'
  'WITH_OBSTACK=musl-obstack'
  'LINKER_PATH=/usr/lib/ld-musl-x86_64.so.1'
  'LOADER_NAME=ld-linux-x86-64.so.2')

build()
{
  cd $pkgname-$pkgver
  make ${_make_args[@]}
}

package()
{
  cd $pkgname-$pkgver
  make ${_make_args[@]} DESTDIR="$pkgdir" install
  mkdir $pkgdir/usr
  mv $pkgdir/lib $pkgdir/usr/lib
}
