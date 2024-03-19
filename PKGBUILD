# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gtk4
pkgname=(gtk4 gtk-update-icon-cache)
pkgver=4.14.1
pkgrel=3
pkgdesc="Multi-platform toolkit for creating graphical user interfaces"
url="https://www.gtk.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  cairo
  fontconfig
  fribidi
  glib
  harfbuzz
  libepoxy
  pango
  wayland
  gdk-pixbuf
  libtiff
  libjpeg
  libxkbcommon
  graphene
  libepoxy
  desktop-file-utils
)
makedepends=(
  meson
  sassc
  wayland-protocols
  gobject-introspection
  vulkan-headers
  vulkan-icd-loader
  glslang
  lld
)
checkdepends=(weston)
source=(
  "https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz"
  gtk-update-icon-cache.{hook,script}
)
sha256sums=('8e6dfd97a9dbe21c0a6d2596fb0c68e6860012848653491d566575846e629a22'
            '5837dfc23c8a7c0621c88c3ccd3e22215d2a0d2e4ea96583c0a605be2f0675ca'
            '5914fd62534d7e8e9df49962162cbb27e3ff5497494d4af2e334af5018bb5eb2')

build()
{
  local meson_options=(
    --libdir=lib
    -D x11-backend=false
    -D broadway-backend=false
    -D media-gstreamer=disabled
    -D print-cups=disabled
    -D vulkan=disabled
    -D demos=false
    -D build-examples=false
    -D build-tests=false
    -D build-testsuite=false
  )
  LD=ld.lld ewe-meson gtk-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

# Checks are ignored due to execinfo.h is missing in musl

package_gtk4()
{
  depends+=(gtk-update-icon-cache)
  meson install -C build --destdir "$pkgdir"
  
  cd $pkgdir
  _pick_ guic \
    usr/bin/gtk4-update-icon-cache
}

package_gtk-update-icon-cache()
{
  pkgdesc="GTK icon cache updater"
  depends=(gdk-pixbuf hicolor-icon-theme librsvg)

  mv $srcdir/pkgs/guic/* "$pkgdir"
  
  ln -s gtk4-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-update-icon-cache.hook
  install -D gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}
