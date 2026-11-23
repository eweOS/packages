# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qgis
pkgver=4.0.2
pkgrel=5
pkgdesc="Geographic Information System (GIS) that supports vector, raster & database formats"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://qgis.org/"
license=(GPL-2.0-or-later)
#FIXME: missing gsl postgresql qt6-webengine ocl-icd opencl-clhpp netcdf hdf5 pdal
depends=(proj geos gdal expat qwt libzip sqlite3 protobuf
         zlib exiv2 libspatialite zstd
         qt6-base qt6-svg qt6-serialport qt6-location qt6-3d qt6-declarative qt6-multimedia
         qscintilla-qt6 qtkeychain-qt6 qca-qt6 python-pyqt6 python-qscintilla-qt6
         libxml2 draco) # laz-perf
makedepends=(cmake ninja fcgi qt6-tools sip pyqt-builder)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin')
# 0001: Backport, avoid clang optimizer hang on qgsfontmanager.cpp
# https://github.com/qgis/QGIS/commit/08b26e53fd30fdac2d84dedecfcabb0ffe66feb7
# 0002: Backport, add PROJ 9.9 tmerczoned projection support
# https://github.com/qgis/QGIS/commit/0af03df2d258646efdcd76b09b5dba9513eeae14
# 0003: Backport, build tests with Qt >= 6.12
# https://github.com/qgis/QGIS/commit/47ab0643e3c158476dd01dee13e7dff8eab59274
source=(
  https://qgis.org/downloads/$pkgname-$pkgver.tar.bz2
  0001-fix-clang-optimizer-hang-on-qgsfontmanager.patch
  0002-add-proj-9.9-tmerczoned-projection.patch
  0003-drop-qtest-disable-keypad-navigation.patch
)
sha256sums=('e1f017c3bc1881a5f534d89188e4d16d4d1bb1413278ea27aef4604ff35b090a'
            'f6b2f5ce4f859db9a28b08fb4cfed3acdb90c8f22d766e1ef9064fbcc11a8480'
            '7bbe47611aad7b3e9c50b514545bd1dd16bdc39e6302ab7293f0e08ec15b9c2d'
            '53e24fdc54a749e2ae63408b38f65ad881aa3aab740c6476207d9c960caf9421')

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
