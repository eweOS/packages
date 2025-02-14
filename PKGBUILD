# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gcr-4
pkgname=(
  gcr-4
  gcr-4-docs
)
pkgver=4.3.1
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
sha256sums=('b77dd3a5bee9352c54333fc7b45906988b34898cac3eb72743acf394d6c41e5d')

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
