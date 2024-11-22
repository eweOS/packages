# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=kmod
pkgname=(kmod libkmod)
pkgver=33
pkgrel=1
pkgdesc="Linux kernel module management"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
depends=('musl' 'zlib' 'openssl' 'xz' 'zstd' 'llvm-libs')
makedepends=('scdoc')
checkdepends=('linux-devel' 'libelf' 'lld' 'linux')
source=(
  "https://www.kernel.org/pub/linux/utils/kernel/$pkgname/$pkgname-$pkgver.tar.xz"
  lfs64.patch
  fix-test-ldflags.patch
)
sha256sums=('dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc'
            '6a780f666ffe25facc5dc0d8c7c422b006de009c92543d663dcc66f4f1e3ac54'
            '540e07c6c5623d7b519a6f9bb18e151c2f764c1d77c22c842d09f2d3daafb844')

prepare()
{
  _patch_ "$pkgbase-$pkgver"
  cd "$pkgbase-$pkgver"
  #FIXME: fix test-depmod
  sed -i 's@testsuite/test-depmod@@' Makefile.am
  sed -i 's@testsuite/test-depmod@@' Makefile.in
}

build()
{
  cd "$pkgbase-$pkgver"
  # use libtool to avoid symlink failure
  export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"

  ./configure \
    --sysconfdir=/etc \
    --with-xz \
    --with-zlib \
    --with-zstd \
    --with-openssl

  make CFLAGS="$CFLAGS -lunwind"
}

check() {
  local kdirs=("/usr/lib/modules/*/build/Makefile")

  local kver kdir=${kdirs[0]%/Makefile}
  IFS=/ read _ _ _ kver _ <<<"$kdir"
  CFLAGS+=" -fuse-ld=lld"
  # use libtool to avoid symlink failure
  export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"

  make -C "$pkgname-$pkgver" check KDIR="$kdir" KVER="$kver" LLVM=1 LLVM_IAS=1
}

package_kmod()
{
  depends=("libkmod=${pkgver}")
  pkgdesc="$pkgdesc tool"
  license=('GPL2')

  # use libtool to avoid symlink failure
  export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"

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
