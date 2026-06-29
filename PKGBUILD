# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gdk-pixbuf
pkgver=2.44.7
pkgrel=1
pkgdesc="A library that loads image data in various formats"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(glib libpng shared-mime-info libtiff libjpeg)
install=gdk-pixbuf.install
provides=(gdk-pixbuf2 libgdk_pixbuf-2.0.so)
makedepends=(gobject-introspection meson)
optdepends=(
  "libwmf: Load .wmf and .apm"
  "libopenraw: Load .dng, .cr2, .crw, .nef, .orf, .pef, .arw, .erf, .mrw, and .raf"
  "libavif: Load .avif"
  "libheif: Load .heif, .heic, and .avif"
  "libjxl: Load .jxl"
  "librsvg: Load .svg, .svgz, and .svg.gz"
  "webp-pixbuf-loader: Load .webp"
)
source=(
  "https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  gdk-pixbuf-query-loaders.hook
)
sha256sums=('797537333e783843ac150f4251de60bf0ddcfad4fa34a292e892bfed58d8d5ef'
            '3e052fbe80d98fa4f88e44c9efa8235d4aea15d5913023a05630570bccc65107')

build() {
  # man requires rst2man
  ewe-meson $pkgname-$pkgver build \
    -D builtin_loaders=all \
    -D gtk_doc=false \
    -D man=false \
    -D installed_tests=false \
    -D android=disabled \
    -D glycin=disabled
  meson compile -C build
}

check() {
  # https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/215
  #meson test -C build --print-errorlogs
  echo "Skipped"
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}
