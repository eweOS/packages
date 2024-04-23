# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=elfutils
pkgname=(libelf elfutils)
pkgver=0.191
pkgrel=2
pkgdesc="libelf is a free ELF object file access library"
arch=(x86_64 aarch64 riscv64)
url="https://sourceware.org/elfutils/"
license=(LGPL3 GPL3)
makedepends=(curl llvm-libs libarchive sqlite xz zlib libuargp musl-fts musl-obstack)
options=(staticlibs)
source=(https://sourceware.org/$_pkgbase/ftp/$pkgver/$_pkgbase-$pkgver.tar.bz2
	musl-utils.patch
	fix-include.patch)	# https://bugs.gentoo.org/925241
sha256sums=('df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871'
            'c92ade324270f3f34fe4978cd55dbfcdc867cf8421d23edc23c78414b5b1ebb3'
            'ad48db627a7016dd8ce8c9da6662d187ae57b31e144299307b598ab9b7e962fa')

prepare()
{
  _patch_ $_pkgbase-$pkgver
}

FLIST_elfutils=(
  "usr/bin/eu-*"
  "usr/share/locale"
  "usr/share/man1/eu-*"
  "usr/share/man3/elf_*"
)

FLIST_libelf=(
  "usr/include"
  "usr/lib"
)

build()
{
  cd $_pkgbase-$pkgver
  autoreconf
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --program-prefix="eu-" \
    --enable-deterministic-archives \
    --disable-debuginfod
  make CFLAGS=-Wno-error CXXFLAGS=-Wno-error
  mkdir -p $srcdir/install
  make DESTDIR="$srcdir/install" install

  cd $srcdir/install
  _pick_ elfutils "${FLIST_elfutils[@]}"
  _pick_ libelf "${FLIST_libelf[@]}"
}

package_elfutils()
{
  pkgdesc+=" (utilities)"
  depends=(libelf=$pkgver)
  mv "$srcdir/pkgs/elfutils/usr" $pkgdir/usr
}

package_libelf()
{
  pkgdesc+=" (libraries)"
  depends=(xz zlib musl-fts musl-obstack libuargp)
  provides=(libasm libdebuginfod libdw libelf)
  mv "$srcdir/pkgs/libelf/usr" $pkgdir/usr
}

