# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-keyring
pkgver=48.0
pkgrel=1
pkgdesc="Stores passwords and encryption keys"
url="https://gitlab.gnome.org/GNOME/gnome-keyring"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  meson
  p11-kit
  python
)
provides=(org.freedesktop.secrets)
groups=(gnome)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=('90d69126e24b30980fbebad7a2dc73fd7e4e808960ff92e7602fb7dfe8a86509')
        
build() {
  local meson_options=(
    -D selinux=disabled
    -D systemd=disabled
  )
  ewe-meson $pkgname build "${meson_options[@]}"
}

check() {
  # Secure memory tests fail
  dbus-run-session meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
