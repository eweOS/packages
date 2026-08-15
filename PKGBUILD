# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=elfutils
pkgname=(libelf elfutils)
pkgver=0.196
pkgrel=1
pkgdesc="libelf is a free ELF object file access library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://sourceware.org/elfutils/"
license=(LGPL-3.0-or-later GPL-3.0-or-later GPL-2.0-or-later)
makedepends=(curl llvm-libs libarchive sqlite xz zlib libuargp musl-fts
             musl-obstack linux-headers zstd libbz2 openssl)
options=(staticlibs)
# 0001: Should be upstreamed, define missing macros and functions for musl
source=(https://sourceware.org/$_pkgbase/ftp/$pkgver/$_pkgbase-$pkgver.tar.bz2
	0001-define-musl-missing-stuff.patch)
sha256sums=('fd5cc6b77ad6773cac93cb3f415f9318ac3b3455eecf801f6b4a742c4f6c7209'
            'c92ade324270f3f34fe4978cd55dbfcdc867cf8421d23edc23c78414b5b1ebb3')
prepare() {
  _patch_ $_pkgbase-$pkgver
}

FLIST_elfutils=(
  "usr/bin/eu-*"
  "usr/share/locale"
  "usr/share/man/*/eu-*"
)

FLIST_libelf=(
  "usr/include"
  "usr/lib"
  "usr/share/man/*/elf*"
  "usr/share/man/*/libelf*"
)

build() {
  cd $_pkgbase-$pkgver
  autoreconf -ivf
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --program-prefix="eu-" \
    --enable-deterministic-archives \
    --disable-debuginfod
  # FIXME: Remove 'po' from SUBDIRS to avoid broken gettext build
  sed -i '/^SUBDIRS/,/^ *$/s/ po//' Makefile
  make CFLAGS="$CFLAGS -Wno-error" CXXFLAGS="$CXXFLAGS -Wno-error"
  mkdir -p "$srcdir"/install
  make DESTDIR="$srcdir/install" install

  cd "$srcdir"/install
  _pick_ elfutils "${FLIST_elfutils[@]}"
  _pick_ libelf "${FLIST_libelf[@]}"
}

package_elfutils() {
  pkgdesc+=" (utilities)"
  license=(GPL-3.0-or-later)
  depends=(musl musl-obstack libarchive libbz2 libuargp libelf=$pkgver
           llvm-libs)

  mv "$srcdir/pkgs/elfutils/usr" "$pkgdir"/usr
}

package_libelf() {
  pkgdesc+=" (libraries)"
  license=('LGPL-3.0-or-later OR GPL-2.0-or-later')
  depends=(libbz2 xz zlib zstd openssl musl-fts musl-obstack libuargp)
  provides=(libasm libdebuginfod libdw libelf)

  mv "$srcdir/pkgs/libelf/usr" "$pkgdir"/usr
}
