# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ostree
pkgver=2024.3
pkgrel=1
pkgdesc="Operating system and container binary deployment and upgrades"
url="https://ostreedev.github.io/ostree/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.0-or-later)
depends=(
  bash
  fuse3
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
  openssl
  python
  xz
)
provides=(libostree-1.so)
source=(
  git+https://github.com/ostreedev/ostree#tag=v$pkgver
  git+https://github.com/containers/composefs.git
  git+https://github.com/mendsley/bsdiff
  git+https://gitlab.gnome.org/GNOME/libglnx.git
  $pkgname-2023.1-use_fuse3.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6cc1e10db1f8c744eec5d128ad7bcd5aa92a8da167784f6727d832c9a4c545bb')

prepare() {
  cd $pkgname

  sed -i 's/CC=gcc/CC=cc/' Makefile-libostree.am

  # use fusemount3 (fuse3)
  git apply -3 ../$pkgname-2023.1-use_fuse3.patch

  git submodule init
  git submodule set-url composefs "$srcdir/composefs"
  git submodule set-url bsdiff "$srcdir/bsdiff"
  git submodule set-url libglnx "$srcdir/libglnx"
  git -c protocol.file.allow=always submodule update

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
    --without-soup
    --without-gpgme
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  # prevent overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  # FIXME: missing dependency
  make check -k -C $pkgname || :
}

package() {
  depends+=(curl glib libarchive openssl xz)

  make DESTDIR="$pkgdir" install -C $pkgname
}

