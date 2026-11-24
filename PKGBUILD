# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mlt
pkgver=7.42.0
pkgrel=1
pkgdesc='An open source multimedia framework'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
             eigen
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
             swig
             vid.stab)
# 0001: Downstream, include sys/select.h for select() under musl
# 0002: Downstream, eweOS does not support X11
source=(git+https://github.com/mltframework/mlt#tag=v$pkgver
        git+https://invent.kde.org/graphics/glaxnimate.git
        git+https://github.com/mbasaglia/thorvg.git
        0001-add-sys-select-header.patch
        0002-remove-X11-include.patch)
sha256sums=('64d056c11ff0e9872f35fd3c7fc1145b5092d8faf944b2a339b54af3732a2b5f'
            'SKIP'
            'SKIP'
            '25cf8b2918d103c4637241ab41931991900b50ca20c246f369e4621646ba0631'
            '4d9c33a6891894fdae4b1c2c5fae1320906bcf1cdae35f5bf44119825e52f3d0')

prepare() {
  cd $pkgname
  git submodule init
  git submodule set-url src/modules/glaxnimate/glaxnimate "$srcdir"/glaxnimate
  git -c protocol.file.allow=always submodule update

  cd src/modules/glaxnimate/glaxnimate
  git submodule init
  git submodule set-url external/thorvg/thorvg "$srcdir"/thorvg
  git -c protocol.file.allow=always submodule update external/thorvg/thorvg

  cd "$srcdir"
  _patch_ "$pkgname"
}

build() {
  # movit: requires GLX
  # jackrack: ladspa
  # not packaged: sox rubberband rnnoise
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMOD_GLAXNIMATE_QT6=ON \
    -DMOD_QT6=ON \
    -DBUILD_TESTS_WITH_QT6=ON \
    -DSWIG_PYTHON=ON \
    -DMOD_RUBBERBAND=OFF \
    -DMOD_SOX=OFF \
    -DMOD_MOVIT=OFF \
    -DMOD_JACKRACK=OFF \
    -DMOD_RNNOISE=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  _install_license_ "$pkgname/COPYING"
}
