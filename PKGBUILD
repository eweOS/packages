# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=flatpak
pkgname=(
  flatpak
  flatpak-docs
)
pkgver=1.18.1
pkgrel=1
pkgdesc="Linux application sandboxing and distribution framework (formerly xdg-app)"
url="https://flatpak.org"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  appstream
  bubblewrap
  curl
  dbus
  dconf
  fuse3
  glib
  json-glib
  libarchive
  libseccomp
  libxml2
  python
  wayland
  ostree
  gpgme
  xdg-dbus-proxy
  zstd
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  gtk-doc
  libxslt
  meson
  python-packaging
  python-pyparsing
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
sha256sums=('9fdf43cd8f7ac8310d2d446117b360433e8075165e97fdc6cce3afb17f8dc7d2'
            '3371dd250e61d9e1633630073fefda153cd4426f72f4afa0c3373ae2e8fea03a'
            '1824cb4eb1cc88702cb2b9f1c55b6dfdf20fca5eab83f6e8e532099281328745')

build() {
  local meson_options=(
    -D dbus_config_dir=/usr/share/dbus-1/system.d
    -D selinux_module=disabled
    -D system_bubblewrap=bwrap
    -D system_dbus_proxy=xdg-dbus-proxy
    -D malcontent=disabled
    -D system_helper=disabled
    -D systemd=disabled
    -D xauth=disabled
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

  cd $pkgdir
  _pick_ docs usr/share/{doc,gtk-doc}
}

package_flatpak-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv pkgs/docs/* "$pkgdir"
}

