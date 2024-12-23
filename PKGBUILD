# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qgis
pkgver=3.40.1
pkgrel=1
pkgdesc="Geographic Information System (GIS) that supports vector, raster & database formats"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://qgis.org/"
license=(GPL)
#FIXME: missing gsl postgresql qt6-webengine ocl-icd opencl-clhpp netcdf hdf5 pdal
depends=(proj geos gdal expat spatialindex qwt libzip sqlite3 protobuf
         zlib exiv2 libspatialite zstd
         qt6-base qt6-svg qt6-serialport qt6-location qt6-3d qt6-declarative qt6-multimedia
         qscintilla-qt6 qtkeychain-qt6 qca-qt6 python-pyqt6 python-qscintilla-qt6
         libxml2 draco) # laz-perf
makedepends=(cmake ninja fcgi qt6-tools sip pyqt-builder)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin')
source=(
  https://qgis.org/downloads/$pkgname-$pkgver.tar.bz2
)
sha256sums=('53110464c9f5ba5562c437e1563ab36dad2f218e6e7d1c0cfbe5b6effe241c8e')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_3D=TRUE \
    -DWITH_QUICK=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QTWEBKIT=FALSE \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DQWT_POLAR_VERSION=0x060200" \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DUSE_OPENCL=OFF \
    -DWITH_PDAL=FALSE \
    -DWITH_GSL=FALSE \
    -DWITH_POSTGRESQL=FALSE \
    -DWITH_QTWEBENGINE=FALSE \
    -DBUILD_WITH_QT6=TRUE
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
