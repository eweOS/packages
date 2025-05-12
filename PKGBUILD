# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-multimedia
pkgname=(qt6-multimedia
         qt6-multimedia-ffmpeg
         qt6-multimedia-gstreamer)
_qtver=6.9.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Classes for audio, video, radio and camera functionality'
depends=(libpulse
         qt6-base)
makedepends=(cmake
             ffmpeg
             gstreamer-devel
             git
             gst-plugins-base
             gst-plugins-bad
             ninja
             qt6-declarative
             qt6-quick3d
             qt6-shadertools)
groups=(qt6)
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('995c3b194f3de3e1929280639642f7661d94aa57523c459dbbf2f71dbdcaa18c')

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  )

  export DIRARGS=(
    -DINSTALL_BINDIR=lib/qt6/bin
    -DINSTALL_PUBLICBINDIR=usr/bin
    -DINSTALL_LIBEXECDIR=lib/qt6
    -DINSTALL_DOCDIR=share/doc/qt6
    -DINSTALL_ARCHDATADIR=lib/qt6
    -DINSTALL_DATADIR=share/qt6
    -DINSTALL_INCLUDEDIR=include/qt6
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}" \
    "${DIRARGS[@]}"
  cmake --build build
}

package_qt6-multimedia() {
  depends+=(qt6-multimedia-backend)
  optdepends=('qt6-declarative: QML bindings'
              'qt6-quick3d: for QtQuick3DAudio')

  DESTDIR="$pkgdir" cmake --install build
# Split plugins
  rm -r "$pkgdir"/usr/lib/qt6/plugins/
  rm "$pkgdir"/usr/lib/cmake/Qt6Multimedia/Qt6Q{FFmpeg,Gstreamer}*
  rm -r "$pkgdir"/usr/include/qt6/Qt{FFmpeg,Gstreamer}MediaPluginImpl \
        "$pkgdir"/usr/lib/cmake/Qt6{FFmpeg,Gstreamer}MediaPluginImplPrivate \
        "$pkgdir"/usr/lib/libQt6{FFmpeg,Gstreamer}MediaPluginImpl.a \
        "$pkgdir"/usr/lib/qt6/metatypes/qt6{ffmpeg,gstreamer}mediapluginimplprivate_relwithdebinfo_metatypes.json \
        "$pkgdir"/usr/lib/qt6/mkspecs/modules/qt_lib_{ffmpeg,gstreamer}mediapluginimpl_private.pri \
        "$pkgdir"/usr/lib/qt6/modules/{FFmpeg,Gstreamer}MediaPluginImplPrivate.json

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}

package_qt6-multimedia-gstreamer() {
  pkgdesc='Gstreamer backend for qt6-multimedia'
  depends=(glib2
           gst-plugins-base
           gstreamer
           libglvnd
           qt6-base
           qt6-multimedia)
  provides=(qt6-multimedia-backend)
  groups=()
  optdepends=('gst-plugins-good: camera support, additional plugins'
              'gst-plugins-bad: camera support, additional plugins'
              'gst-plugins-ugly: additional plugins'
              'gst-libav: additional plugins')
  
  DESTDIR="$pkgdir" cmake --install build/src/plugins/multimedia/gstreamer    
}

package_qt6-multimedia-ffmpeg() {
  pkgdesc='FFMpeg backend for qt6-multimedia'
  depends=(ffmpeg
           libglvnd
           qt6-base
           qt6-declarative
           qt6-multimedia)
  provides=(qt6-multimedia-backend)
  groups=()

  DESTDIR="$pkgdir" cmake --install build/src/plugins/multimedia/ffmpeg
}
