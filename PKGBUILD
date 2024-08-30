# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsoup3
pkgname=(
  libsoup3
  libsoup3-docs
)
pkgver=3.6.0
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.0-or-later)
depends=(
  brotli
  glib2
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
sha256sums=('a83fffb4de51bc53d3e68849ebb721d51e4cad3334d7344cff357c6d500bdcfd')

build() {
  local meson_options=(
    -D sysprof=disabled
    -D tls_check=false
    -D pkcs11_tests=disabled
    -D ntlm=disabled
    -D autobahn=disabled
  )

  ewe-meson libsoup build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Python's output buffering messes with the tests reading stdout lines from
  # http2-server.py through a pipe
  # ignore hsts tests
  test_list=$(meson test --list -C build 2> /dev/null | grep -v 'hsts')
  PYTHONUNBUFFERED=1 meson test -C build --print-errorlogs $test_list
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
