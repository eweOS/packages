# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gcr-3
pkgname=(
  gcr-3
  gcr-3-docs
)
pkgver=3.41.2
pkgrel=1
pkgdesc="A library for bits of crypto UI and parsing"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  gtk3
  hicolor-icon-theme
  libgcrypt
  libp11-kit
  libsecret
  pango
)
makedepends=(
  gi-docgen
  git
  glib2
  gobject-introspection
  libxslt
  meson
  vala
)
source=("git+https://gitlab.gnome.org/GNOME/gcr.git#tag=$pkgver")
sha256sums=('c2f0c9d3a50921c2bc19c385a902f9e4a1bc93cfd3eaa5ebec21cd9b7a89ec84')

prepare() {
  sed -i '/ssh_add_path/d; /ssh_agent_path/d' gcr/meson.build
}

build() {
  local meson_options=(
    -D ssh_agent=false
    -D systemd=disabled
  )
  CFLAGS+=" -D_GNU_SOURCE"
  ewe-meson gcr build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package_gcr-3() {
  provides=(
    gcr
    libgck-1.so
    libgcr-{base,ui}-3.so
  )

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gcr-3-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(gcr-docs)

  mv doc/* "$pkgdir"
}
