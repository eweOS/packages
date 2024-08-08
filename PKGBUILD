# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libxslt
pkgname=(
  libxslt
  libxslt-docs
)
pkgver=1.1.42
pkgrel=1
pkgdesc="XML stylesheet transformation library"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
arch=(x86_64 aarch64 riscv64)
license=(custom:MIT)
depends=(
  libgcrypt
  libxml2
  xz
)
makedepends=(
  git
  python
)
checkdepends=(
  docbook-xml
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxslt.git#tag=v$pkgver"
  fix-libxml2-test.patch
)
sha256sums=('088acc3837fe1f995ddf35c8d68e84469ba06a88369af0f82e09c0e0e035514f'
            'efaf91c7c8a6b0101ae993858af199b42260ec415b7869e3c03e45d554c3d722')

prepare() {
  _patch_ libxslt
  cd libxslt
  rm tests/REC/test-10-3.* # FIXME: locale issue
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --with-python=/usr/bin/python
  )

  cd libxslt
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  make check
}

package_libxslt() {
  optdepends=('python: Python bindings')
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
