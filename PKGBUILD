# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gcr-4
pkgname=(
  gcr-4
  gcr-4-docs
)
pkgver=4.4.0.1
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  libgcrypt
  libp11-kit
  libsecret
)
makedepends=(
  gi-docgen
  git
  glib2
  gobject-introspection
  gtk4
  meson
  vala
)
checkdepends=(dbus)
source=("git+https://gitlab.gnome.org/GNOME/gcr.git#tag=$pkgver")
sha256sums=('377fe87a91273d6ca42aec14ce504a043a09b90b0537a5fd81133999541537e0')

build() {
  local meson_options=(
    -D crypto=libgcrypt
    -D ssh_agent=false
    -D systemd=disabled
  )

  ewe-meson gcr build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package_gcr-4() {
  optdepends=('gtk4: gcr-viewer-gtk4')
  provides=(
    libgck-2.so
    libgcr-4.so
  )

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gcr-4-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
