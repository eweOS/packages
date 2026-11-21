# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=appstream-glib
pkgver=0.8.4
pkgrel=1
pkgdesc="Objects and methods for reading and writing AppStream metadata"
url="https://people.freedesktop.org/~hughsient/appstream-glib/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  curl
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  json-glib
  libarchive
  libyaml
  libalpm
  pango
  util-linux-libs
)
makedepends=(
  git
  gobject-introspection
  gperf
  meson
)
provides=(
  appdata-tools
  libappstream-glib.so
)
source=("git+https://github.com/hughsie/appstream-glib#tag=appstream_glib_${pkgver//./_}")
sha256sums=('1bbb1b2ea5ccdacb6c74cc0399d37461b1a08b83e6b1def1dfe2f2de4763bad1')

build() {
  local meson_options=(
    -D alpm=true
    -D rpm=false
  )

  ewe-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/usr/share/installed-tests"
}
