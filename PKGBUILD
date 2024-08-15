# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flatpak
pkgver=1.15.10
pkgrel=1
pkgdesc="Linux application sandboxing and distribution framework (formerly xdg-app)"
url="https://flatpak.org"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  appstream
  bubblewrap
  curl
  dbus
  fuse3
  glib
  json-glib
  libarchive
  libseccomp
  python
  wayland
  ostree
  gpgme
  xdg-dbus-proxy
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  libxslt
  meson
  xmlto
  wayland-protocols
)
checkdepends=(
  socat
)
source=(
  "git+https://github.com/flatpak/flatpak#tag=$pkgver"
  https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak-bindir.sh
)
sha256sums=('b2692a6d61daca8a01a6872bd66a66e6199b0e657a2c231feeeda8e142f8b827'
            '3371dd250e61d9e1633630073fefda153cd4426f72f4afa0c3373ae2e8fea03a'
            '1824cb4eb1cc88702cb2b9f1c55b6dfdf20fca5eab83f6e8e532099281328745')

prepare() {
  cd flatpak
  # FIXME: package python-pyparsing
  pip install pyparsing
}

build() {
  local meson_options=(
    -D dbus_config_dir=/usr/share/dbus-1/system.d
    -D selinux_module=disabled
    -D system_bubblewrap=bwrap
    -D system_dbus_proxy=xdg-dbus-proxy
    -D dconf=disabled
    -D malcontent=disabled
    -D system_helper=disabled
    -D systemd=disabled
    -D xauth=disabled
    -D gtkdoc=disabled
    -D docbook_docs=disabled
    -D man=disabled
    -D tests=false
  )

  ewe-meson flatpak build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_flatpak() {
  depends+=(
    ostree
    xdg-desktop-portal
  )
  provides=(libflatpak.so)

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/etc/profile.d" -m644 flatpak-bindir.sh
  install -Dt "$pkgdir/etc/flatpak/remotes.d" flathub.flatpakrepo

  # remove systemd services
  rm -r $pkgdir/usr/lib/systemd
}
