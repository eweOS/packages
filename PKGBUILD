# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flatpak
pkgver=1.15.6
pkgrel=2
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
  git+https://gitlab.gnome.org/GNOME/libglnx.git
  git+https://github.com/projectatomic/bubblewrap
  git+https://github.com/flatpak/xdg-dbus-proxy
  git+https://gitlab.gnome.org/alexl/variant-schema-compiler.git
  https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak-bindir.sh
  0001-HACK-Use-fusermount3.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3371dd250e61d9e1633630073fefda153cd4426f72f4afa0c3373ae2e8fea03a'
            '1824cb4eb1cc88702cb2b9f1c55b6dfdf20fca5eab83f6e8e532099281328745'
            'fe358fe7a7b54d165e94f43e8284ad9fa7d00610bc67179fdefe86538d3b660a')

pkgver() {
  cd flatpak
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd flatpak

  # Support fuse3
  # https://bugs.archlinux.org/task/75623
  git apply -3 ../0001-HACK-Use-fusermount3.patch

  git submodule init
  git submodule set-url subprojects/libglnx "$srcdir/libglnx"
  git submodule set-url subprojects/bubblewrap "$srcdir/bubblewrap"
  git submodule set-url subprojects/dbus-proxy "$srcdir/xdg-dbus-proxy"
  git submodule set-url subprojects/variant-schema-compiler "$srcdir/variant-schema-compiler"
  git -c protocol.file.allow=always submodule update

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
