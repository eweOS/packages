# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsoup3
pkgname=(
  libsoup3
  libsoup3-docs
)
pkgver=3.6.1
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(
  brotli
  glib2
  glib-networking
  krb5
  libnghttp2
  libpsl
  sqlite
  zlib
)
makedepends=(
  gi-docgen
  git
  glib2
  gobject-introspection
  meson
  vala
)
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#tag=$pkgver")
sha256sums=('44d616e7e6617ac18f30db89c828c16d79f17e27c0fe9dd618540213f2b5a99f')

build() {
  local meson_options=(
    -D sysprof=disabled
    -D ntlm=disabled
    -D pkcs11_tests=disabled
    -D autobahn=disabled
  )

  ewe-meson libsoup build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Python's output buffering messes with the tests reading stdout lines from
  # http2-server.py through a pipe
  PYTHONUNBUFFERED=1 meson test -C build --print-errorlogs --timeout-multiplier=10
}

package_libsoup3() {
  depends+=(
    libbrotlidec.so
    libgssapi_krb5.so
    libg{lib,object,io}-2.0.so
    libpsl.so
  )
  optdepends=('samba: Windows Domain SSO')
  provides+=(libsoup-3.0.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libsoup3-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
