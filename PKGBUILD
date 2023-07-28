# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgbase=kmod
pkgname=(kmod libkmod)
pkgver=30
pkgrel=1
pkgdesc="Linux kernel module management"
arch=(x86_64 aarch64 riscv64)
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
depends=('musl' 'zlib' 'openssl' 'xz' 'zstd' 'llvm-libs')
#checkdepends=('linux-headers' 'libelf')
source=("https://www.kernel.org/pub/linux/utils/kernel/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('f897dd72698dc6ac1ef03255cd0a5734ad932318e4adbaebc7338ef2f5202f9f')

build()
{
  cd "$pkgbase-$pkgver"

  ./configure \
    --sysconfdir=/etc \
    --with-xz \
    --with-zlib \
    --with-zstd \
    --with-openssl

  make CFLAGS="$CFLAGS -lunwind"
}

# not available, no build in /usr/lib/modules
#check() {
#  local kdirs=("/usr/lib/modules/*/build/Makefile")
#
#  local kver kdir=${kdirs[0]%/Makefile}
#  IFS=/ read _ _ _ kver _ <<<"$kdir"
#
#  make -C "$pkgname-$pkgver" check KDIR="$kdir" KVER="$kver"
#}

package_kmod()
{
  depends=("libkmod=${pkgver}")
  pkgdesc="$pkgdesc tool"
  license=('GPL2')

  make -C "$pkgbase-$pkgver" DESTDIR="$pkgdir" install
  install -d libkmod
  mv $pkgdir/usr/{lib,include} $srcdir/libkmod
  install -Dm644 $pkgbase-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_libkmod()
{
  pkgdesc="$pkgdesc library"
  provides=('libkmod.so')
  license=('LGPL2')

  install -d $pkgdir/usr
  mv libkmod/* $pkgdir/usr
  install -Dm644 $pkgbase-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
