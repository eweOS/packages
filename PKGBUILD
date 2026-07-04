# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gegl
pkgver=0.4.70
pkgrel=4
pkgdesc='Graph based image processing framework'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gegl.org/'
license=('GPL-3.0-or-later OR LGPL-3.0-or-later')
depends=('babl' 'cairo' 'gdk-pixbuf2' 'glib2' 'jasper' 'json-glib' 'lcms2'
         'lensfun' 'libjpeg-turbo' 'libpng' 'libraw' 'librsvg' 'libspiro' 'libtiff' 'libwebp'
         'openexr' 'pango' 'poppler-glib')
makedepends=('ffmpeg' 'git' 'gobject-introspection' 'libgexiv2' 'meson' 'python-gobject' 'sdl2'
             'vala' 'gi-docgen')
optdepends=('ffmpeg: FFmpeg Frame Loader and FFmpeg Frame Saver plugins'
            'graphviz: for gegl-introspect'
            'sdl2: SDL2 Display plugin')
source=("git+https://gitlab.gnome.org/GNOME/gegl.git#tag=GEGL_${pkgver//./_}")
sha256sums=('2d1d8e77b18be3db417b37247b80e798d51cfc2ac27cc881f30089f9723899df')

build() {
  mkdir -p build
  cd build
  ewe-meson ../"${pkgname}" \
    -Dworkshop=true \
    -Dmrg=disabled \
    -Dmaxflow=disabled \
    -Dlua=disabled \
    -Dlibv4l=disabled \
    -Dlibv4l2=disabled \
    -Dumfpack=disabled
  ninja
}

check() {
  cd build
  ninja test || :
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
