# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mlt
pkgver=7.34.1
pkgrel=4
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
source=(git+https://github.com/mltframework/mlt#tag=v$pkgver
        git+https://gitlab.com/mattbas/glaxnimate.git
        no-x11.patch)
sha256sums=('960137f625fd0cfa3f74b020e1c755c87039d4789ab4960fa6b9e1c976c47f59'
            'SKIP'
            '4d9c33a6891894fdae4b1c2c5fae1320906bcf1cdae35f5bf44119825e52f3d0')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  git submodule init
  git submodule set-url src/modules/glaxnimate/glaxnimate "$srcdir"/glaxnimate
  git -c protocol.file.allow=always submodule update
}

build() {
  # movit: requires GLX
  # jackrack: ladspa
  # not packaged: sox rubberband
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMOD_GLAXNIMATE=OFF \
    -DMOD_GLAXNIMATE_QT6=ON \
    -DMOD_QT6=ON \
    -DBUILD_TESTS_WITH_QT6=ON \
    -DSWIG_PYTHON=ON \
    -DMOD_RUBBERBAND=OFF \
    -DMOD_SOX=OFF \
    -DMOD_MOVIT=OFF \
    -DMOD_JACKRACK=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
