# Maintainer: Julian Droske <juliandroske@outlook.com>

pkgbase=emacs
pkgname=(
  emacs
  emacs-nogui
)
pkgver=30.1
pkgrel=1
url='https://www.gnu.org/software/emacs/emacs.html'
pkgdesc='Extensible, customizable, self-documenting free/libre text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
provides=(emacs)
conflicts=(emacs)
depends=(
  musl
  acl
  dbus
  ncurses
  libxml2
  zlib-ng
)
makedepends=(
  make
  texinfo

  linux-headers

  at-spi2-core
  libjpeg
  libpng
  librsvg
  dav1d
  libtiff
  fontconfig
  freetype2
  harfbuzz
  pango
  cairo
  glib
  gtk3
  gdk-pixbuf
  alsa-lib
)
source=(
  "https://ftp.gnu.org/gnu/emacs/emacs-${pkgver}.tar.gz"
)
sha256sums=(
  '54404782ea5de37e8fcc4391fa9d4a41359a4ba9689b541f6bc97dd1ac283f6c'
)

prepare() {
  # duplicate package to build the nogui version from the same source
  # cp in busybox has no --reflink option to perform CoW
  cp -ar "emacs-${pkgver}" "emacs-nogui-${pkgver}"
}

build() {
  local _confflags="
    --sysconfdir=/etc
    --prefix=/usr
    --libexecdir=/usr/lib
    --localstatedir=/var
    --without-gnutls
    --with-harfbuzz
    --disable-build-details
  "

  cd "emacs-${pkgver}"
  ./configure $_confflags \
    --with-pgtk
  make

  cd "../emacs-nogui-${pkgver}"
  ./configure $_confflags \
    --without-x \
    --without-sound
  make
}

# Remove systemd-related directories hard-coded in Makefile
_postpackage() {
  rm -rf "${pkgdir}/usr/lib/systemd"
}

package_emacs() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  _postpackage
}

package_emacs-nogui() {
  pkgdesc="${pkgdesc} - without GUI"
  depends+=(
    at-spi2-core
    libjpeg
    libpng
    librsvg
    dav1d
    libtiff
    fontconfig
    freetype2
    harfbuzz
    pango
    cairo
    glib
    gtk3
    gdk-pixbuf
    alsa-lib
  )
  provides+=(emacs-nox)

  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  _postpackage
}
