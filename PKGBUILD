# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ostree
pkgver=2026.2
pkgrel=1
pkgdesc="Operating system and container binary deployment and upgrades"
url="https://ostreedev.github.io/ostree/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(
  bash
  composefs
  fuse3
  gpgme
  libgpg-error
  libsodium
  util-linux
  zlib
)
makedepends=(
  curl
  e2fsprogs
  git
  glib
  gobject-introspection
  libarchive
  libsoup3
  linux-headers
  openssl
  python
  xz
)
provides=(libostree-1.so)
# 0001: Downstream patch, we use fusermount3 instead of fusemount in tests
source=(
  git+https://github.com/ostreedev/ostree#tag=v$pkgver
  git+https://github.com/mendsley/bsdiff
  git+https://gitlab.gnome.org/GNOME/libglnx.git
  0001-$pkgname-2023.1-use_fuse3.patch
)
sha256sums=('dc2ffa05475890914cc6f2a77869ae2a5e365e9baf7bd7076b7500d708ce9667'
            'SKIP'
            'SKIP'
            '6cc1e10db1f8c744eec5d128ad7bcd5aa92a8da167784f6727d832c9a4c545bb')

prepare() {
  _patch_ $pkgname

  cd $pkgname

  # Use CC instead of GCC
  sed -i 's/CC=gcc/CC=cc/' Makefile-libostree.am

  # use fusemount3 (fuse3)
  # git apply -3 ../$pkgname-2023.1-use_fuse3.patch

  git submodule init
  git submodule set-url bsdiff "$srcdir/bsdiff"
  git submodule set-url libglnx "$srcdir/libglnx"
  git -c protocol.file.allow=always submodule update

  # https://github.com/ostreedev/ostree/issues/3399
  git cherry-pick -n bd2a9753e5227c97bda737e00a00451d361449f3

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --disable-static
    --enable-experimental-api
    --libexecdir=/usr/lib
    --localstatedir=/var
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-curl
    --with-ed25519-libsodium
    --with-openssl
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

check() {
  # FIXME: missing dependency
  make check -k -C $pkgname || :
}

package() {
  depends+=(curl glib gpgme libarchive openssl xz)

  make DESTDIR="$pkgdir" install -C $pkgname
}
