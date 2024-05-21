# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glade
pkgver=3.40.0
pkgrel=1
pkgdesc="User Interface Builder for GTK+ applications"
url="https://glade.gnome.org/"
arch=(x86_64 aarch64 riscv64)
license=(GPL LGPL)
depends=(gtk3 libxml2)
makedepends=(gobject-introspection itstool docbook-xsl git meson)
provides=(libgladeui-2.so)
source=("git+https://gitlab.gnome.org/GNOME/glade.git#tag=GLADE_${pkgver//./_}"
        fix-build.diff)
sha256sums=('SKIP'
            '0dd99583c4b7b6327e84a909614f46ec0062dbc9f67be733ea97dc294e40317b')

prepare() {
  cd glade

  # Fix missing dependency on vcs_tag
  git apply -3 ../fix-build.diff

  # error processing hi lang
  sed -i 's/^hi$//' help/LINGUAS
}

build() {
  ewe-meson glade build -D webkit2gtk=disabled -D gjs=disabled -D python=disabled -D man=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
