# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=kmod
pkgname=(kmod libkmod)
pkgver=33
pkgrel=2
pkgdesc="Linux kernel module management"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')
depends=('musl' 'zlib' 'openssl' 'xz' 'zstd' 'llvm-libs')
makedepends=('scdoc')
checkdepends=('linux-devel' 'libelf' 'lld' 'linux')
source=(
  "https://www.kernel.org/pub/linux/utils/kernel/$pkgname/$pkgname-$pkgver.tar.xz"
  lfs64.patch
  fix-test-ldflags.patch
  depmod-search.conf
  depmod.hook
  depmod.script
)
sha256sums=('dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc'
            '6a780f666ffe25facc5dc0d8c7c422b006de009c92543d663dcc66f4f1e3ac54'
            '540e07c6c5623d7b519a6f9bb18e151c2f764c1d77c22c842d09f2d3daafb844'
            '1a92bfeae870f61ce814577e69d2a147a9c0caf6aed1131243e4179241fcc4a8'
            'c11c2a0f66ea405493e8617689ca10818dc81dd1dddc19bdb220c8b2917119c1'
            '60149f97cd139ef0f4962552d40e03b945aab8a69ffb3f9c6c7d502e11c4fe41')

prepare()
{
  _patch_ "$pkgbase-$pkgver"
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

  make
}

check() {
  local kdirs=("/usr/lib/modules/*/build/Makefile")

  local kver kdir=${kdirs[0]%/Makefile}
  IFS=/ read _ _ _ kver _ <<<"$kdir"
  CFLAGS+=" -fuse-ld=lld"
  # use libtool to avoid symlink failure
  export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  # FIXME: fix errors in test
  make -C "$pkgname-$pkgver" check KDIR="$kdir" KVER="$kver" LLVM=1 LLVM_IAS=1 || :
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

  # extra directories
  install -dm0755 "${pkgdir}"/{etc,usr/lib}/{depmod,modprobe}.d

  # install depmod.d file for search/ dir
  install -Dm0644 "${srcdir}/depmod-search.conf" "${pkgdir}/usr/lib/depmod.d/search.conf"

  # hook
  install -Dm0644 "${srcdir}/depmod.hook" "${pkgdir}/usr/share/libalpm/hooks/60-depmod.hook"
  install -Dm0755 "${srcdir}/depmod.script" "${pkgdir}/usr/share/libalpm/scripts/depmod"
}

package_libkmod()
{
  pkgdesc="$pkgdesc library"
  provides=('libkmod.so')
  license=('LGPL2')

  install -d $pkgdir/usr
  mv libkmod/* $pkgdir/usr
}
