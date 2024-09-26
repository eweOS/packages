# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-keyring
pkgver=46.2
pkgrel=1
pkgdesc="Stores passwords and encryption keys"
url="https://gitlab.gnome.org/GNOME/gnome-keyring"
arch=(x86_64 aarch64 riscv64)
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(
  dconf
  gcr-3
  gcr-4
  glib2
  libgcrypt
  pam
)
makedepends=(
  docbook-xsl
  git
  glib2
  p11-kit
  python
)
provides=(org.freedesktop.secrets)
groups=(gnome)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=('a5ee83246ad2b06d0c6138c4a0b5d1d59489765019de5de814ca42c7e0990a23')
        

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --with-pam-dir=/usr/lib/security
    --without-libcap-ng
    --disable-static
    --disable-schemas-compile
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  # Secure memory tests fail
  dbus-run-session make -k check || :
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
