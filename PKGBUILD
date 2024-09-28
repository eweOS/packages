# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-multimedia
pkgname=(qt6-multimedia
         qt6-multimedia-ffmpeg
         qt6-multimedia-gstreamer)
pkgver=6.7.2
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
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
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('20ef112e2f6dc07dd8e8b2f2f72b4c8ffe510367ac3f301b76ea7514f5535169')

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
  rm -r "$pkgdir"/usr/include/qt6/QtQGstreamerMediaPlugin \
        "$pkgdir"/usr/lib/cmake/Qt6QGstreamerMediaPluginPrivate \
        "$pkgdir"/usr/lib/libQt6QGstreamerMediaPlugin.a \
        "$pkgdir"/usr/lib/qt6/metatypes/qt6qgstreamermediapluginprivate_relwithdebinfo_metatypes.json \
        "$pkgdir"/usr/lib/qt6/mkspecs/modules/qt_lib_qgstreamermediaplugin_private.pri \
        "$pkgdir"/usr/lib/qt6/modules/QGstreamerMediaPluginPrivate.json

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
           qt6-multimedia)
  provides=(qt6-multimedia-backend)
  groups=()

  DESTDIR="$pkgdir" cmake --install build/src/plugins/multimedia/ffmpeg
}
