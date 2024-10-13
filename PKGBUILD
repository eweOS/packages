# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gegl
pkgver=0.4.48
pkgrel=1
pkgdesc='Graph based image processing framework'
arch=('x86_64' 'aarch64' 'riscv64')
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
sha256sums=('bed1b1f0348519a175422800564c65c372b125b4230a0207342911bf07f34ded')

prepare() {
  cd "${pkgname}"
  # https://gitlab.archlinux.org/archlinux/packaging/packages/gegl/-/issues/1
  # https://gitlab.gnome.org/GNOME/gegl/-/issues/368
  git cherry-pick --mainline 1 --no-commit \
      ab6c62963dff7c7d464f4453f2f3f554221e5c16 \
      a54105e15c9012933b5d830a32aef76f4e04290e \
      66de8124f496617eee8e6b5c68138a00343882db \
      298b6a2afb87b4b5b15c6e715967b57534cd0af0
}

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
