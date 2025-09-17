# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libproxy
pkgname=(
  libproxy
  libproxy-docs
)
pkgver=0.5.11
pkgrel=1
pkgdesc="Automatic proxy configuration management library"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  curl
  duktape
  glib2
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  gsettings-desktop-schemas
  meson
  vala
)
source=(
  "git+https://github.com/libproxy/libproxy#tag=$pkgver"
)
sha256sums=('d6507be9abfd8a04e53cd2de278d19ba501e9ffb9c02fcdbd00a972cc45b513c')

build() {
  local meson_options=(
    -D release=true
  )

  ewe-meson libproxy build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libproxy() {
  provides=(libproxy.so)
  conflicts=('libproxy-webkit<0.5.0-1')

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libproxy-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
