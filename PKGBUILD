# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qgis
pkgver=4.4.0
pkgrel=1
pkgdesc="Geographic Information System (GIS) that supports vector, raster & database formats"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://qgis.org/"
license=(GPL-2.0-or-later)
# Clang LTO drops dynamic init of QgsSettingsTree inline statics, crashing crssync.
options=(!lto)
#FIXME: missing gsl postgresql qt6-webengine ocl-icd opencl-clhpp netcdf hdf5 pdal
depends=(proj geos gdal expat qwt libzip sqlite3 protobuf
         zlib exiv2 libspatialite zstd
         qt6-base qt6-svg qt6-serialport qt6-location qt6-3d qt6-declarative qt6-multimedia
         qscintilla-qt6 qtkeychain-qt6 qca-qt6 python-pyqt6 python-qscintilla-qt6
         libxml2 draco) # laz-perf
makedepends=(cmake ninja fcgi qt6-tools sip pyqt-builder wayland-protocols)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin')
source=(
  https://qgis.org/downloads/$pkgname-$pkgver.tar.bz2
)
sha256sums=('1080c2c27e90c77d149ed3fee4f7098847ce4ecb37aec599ed296cd549bda454')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  # Use vendored spatialindex to work around upstream breakage
  # https://github.com/libspatialindex/libspatialindex/issues/276
  cmake -S $pkgname-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_3D=TRUE \
    -DWITH_QUICK=TRUE \
    -DWITH_SERVER=TRUE \
    -DQGIS_QML_SUBDIR=lib/qt/qml \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DUSE_OPENCL=OFF \
    -DWITH_PDAL=FALSE \
    -DWITH_GSL=FALSE \
    -DWITH_POSTGRESQL=FALSE \
    -DWITH_QTWEBENGINE=FALSE \
    -DWITH_INTERNAL_SPATIALINDEX=TRUE \
    # https://github.com/qgis/QGIS/issues/48374
    #-DWITH_INTERNAL_LAZPERF=FALSE \
    # https://github.com/qgis/QGIS/issues/35440
    #-DWITH_PY_COMPILE=TRUE \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
