# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libxslt
pkgname=(
  libxslt
  libxslt-docs
)
pkgver=1.1.45
pkgrel=1
pkgdesc="XML stylesheet transformation library"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:MIT)
depends=(
  libgcrypt
  libxml2
  xz
)
makedepends=(
  git
)
checkdepends=(
  docbook-xml
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxslt.git#tag=v$pkgver"
)
sha256sums=('ff4992ab492670781f37b958caab062cd4612f2c6826c01dd4999f30263208ba')

prepare() {
  cd libxslt
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  # python binding and tests are disabled for now
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --with-python=no
  )

  cd libxslt
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  # test suite needs deprecated Python libxml2 module
  # https://gitlab.gnome.org/GNOME/libxslt/-/issues/164
  #make check
}

package_libxslt() {
  provides=(lib{,e}xslt.so)

  cd libxslt
  make DESTDIR="$pkgdir" install

  mkdir -p ../doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t ../doc/usr/share

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxslt-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxslt/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}
