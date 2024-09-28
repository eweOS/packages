# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mlt
pkgver=7.28.0
pkgrel=1
pkgdesc='An open source multimedia framework'
arch=(x86_64 aarch64 riscv64)
url='https://www.mltframework.org'
license=(LGPL-2.1-only)
depends=(libebur128)
optdepends=('ffmpeg: ffmpeg plugin'
            'fftw: plus plugin'
            'fontconfig: gdk plugin'
            'frei0r-plugins: for additional effects'
            'gdk-pixbuf2: gdk plugin'
            'glib2: gdk plugin'
            'jack: JACK sound output plugin'
            'ladspa: LADSPA plugins'
            'libepoxy: opengl plugin'
            'libexif: auto rotate plugin'
            'libglvnd: opengl plugin'
            'libsamplerate: libavresample plugin'
            'libvorbis: vorbis plugin'
            'libxml2: XML plugin'
            'movit: opengl plugin'
            'opencv: openCV plugin'
            'qt6-base: Qt6 plugin'
            'qt6-5compat: Qt6 plugin'
            'qt6-svg: Qt6 plugin'
            'pango: gdk plugin'
            'python: python bindings'
            'rtaudio: rtaudio plugin'
            'rubberband: audio pitch plugin'
            'sdl2: SDL2 plugin'
            'sdl_image: SDL1 plugin'
            'sdl12-compat: SDL1 plugin'
            'sox: SOX (Audio Swiss Army Knife) plugin'
            'vid.stab: video stabilize plugin'
            'zlib: glaxnimate plugin')
makedepends=(cmake
             ffmpeg
             frei0r-plugins
             gdk-pixbuf2
             git
             libexif
             libsamplerate
             pango
             python
             qt6-5compat
             qt6-svg
             swig)
source=(git+https://github.com/mltframework/mlt#tag=v$pkgver
        git+https://gitlab.com/mattbas/glaxnimate.git)
sha256sums=('b1723017d5b122542d2abad6eda156c567ebe2963a8007dfabba8657f7a732f3'
            'SKIP')

prepare() {
  cd $pkgname
  sed -i '/Xlib.h/d' src/modules/qt/common.cpp
  git submodule init
  git submodule set-url src/modules/glaxnimate/glaxnimate "$srcdir"/glaxnimate
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMOD_GLAXNIMATE=ON \
    -DMOD_GLAXNIMATE_QT6=ON \
    -DMOD_QT6=ON \
    -DSWIG_PYTHON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
