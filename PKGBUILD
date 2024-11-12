# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcdio
pkgver=2.1.0
pkgrel=2
pkgdesc="GNU Compact Disc Input and Control Library"
url="https://www.gnu.org/software/libcdio/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL3)
depends=(ncurses)
makedepends=(git help2man texinfo linux-headers)
source=("git+https://git.savannah.gnu.org/git/libcdio.git#tag=release-$pkgver")
sha256sums=('c4c46da0ef86e373f99e201db749d3c3df796261a31ab989dde0ec9ffe12d352')

prepare() {
  cd $pkgname

  # Format security
  git cherry-pick -n 2adb43c60afc6e98e94d86dad9f93d3df52862b1

  # realpath test failure
  git cherry-pick -n 56335fff0f21d294cd0e478d49542a43e9495ed0

  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-vcd-info --disable-cddb --enable-cpp-progs --disable-static \
    --enable-maintainer-mode
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make -C test check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  sed -e "/define CDIO_LIBCDIO_SOURCE_PATH/s|.*|/* #undef CDIO_LIBCDIO_SOURCE_PATH */|" \
      -i "$pkgdir/usr/include/cdio/cdio_config.h"
}
