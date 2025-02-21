# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libsecret
pkgname=(
  libsecret
  libsecret-docs
)
pkgver=0.21.6
pkgrel=1
pkgdesc="Library for storing and retrieving passwords and other secrets"
url="https://gnome.pages.gitlab.gnome.org/libsecret/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  libgcrypt
)
makedepends=(
  bash-completion
  docbook-xsl
  gi-docgen
  git
  gobject-introspection
  meson
  vala
)
checkdepends=(
  python-dbus
  python-gobject
)
source=("git+https://gitlab.gnome.org/GNOME/libsecret.git#tag=$pkgver")
sha256sums=('d44ef22a86f306434b6fc6ebc98b967c93f378cf1e9d3e34ba047dd5cbf88fbf')

prepare() {
  cd $pkgbase

  # Secure memory tests fail in containers
  sed -i '/test-secmem/d' egg/meson.build
}

build() {
  ewe-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session bash -c "meson test -C build --print-errorlogs --timeout-multiplier=10"
}

package_libsecret() {
  optdepends=('org.freedesktop.secrets: secret storage backend')
  provides=(libsecret-1.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libsecret-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
