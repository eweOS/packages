# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gcompat
pkgver=1.1.0
pkgrel=4
pkgdesc="The GNU C Library compatibility layer for musl"
url="https://git.adelielinux.org/adelie/gcompat"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('NCSA')
depends=('libucontext' 'musl' 'musl-obstack' 'utmps')
makedepends=('musl-static')
source=("https://git.adelielinux.org/adelie/gcompat/-/archive/$pkgver/gcompat-$pkgver.tar.gz")
sha512sums=('8f27aa8d268586ecb647bc147a9d56704d087b0f3ac357c6c239958663ec9e9e428e6cfdb9a063ead5c2098444cc4a7c4567c18477309feb05ed3de01b24f9e8')
provides=('glibc')

case $CARCH in
  x86_64)
    loader_soname="ld-linux-x86-64.so.2"
    ;;
  aarch64)
    loader_soname="ld-linux-aarch64.so.1"
    ;;
  riscv64)
    loader_soname="ld-linux-riscv64-lp64d.so.1"
    ;;
  loongarch64)
    loader_soname="ld-linux-loongarch-lp64d.so.1"
    ;;
esac

_make_args=(
  'WITH_LIBUCONTEXT=1'
  'WITH_OBSTACK=musl-obstack'
  "LINKER_PATH=/usr/lib/ld-musl-$CARCH.so.1"
  "LOADER_NAME=$loader_soname"
)

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

  for i in libc.so.6 libcrypt.so.1 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
	ln -sfv libgcompat.so.0 "$pkgdir"/usr/lib/$i
  done
}
