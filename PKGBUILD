# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=merkaartor
pkgver=0.20.0
pkgrel=12
pkgdesc='OpenStreetMap editor'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='http://merkaartor.be/'
license=('GPL-2.0-or-later')
depends=('exiv2' 'gdal' 'hicolor-icon-theme' 'qt6-svg' 'qt6-networkauth' 'qt6-5compat' 'protobuf')
makedepends=('qt6-tools' 'cmake')
# 0001: Backport, 61fac7791e2c ("Fixed a crash on download when no server is loaded from config.")
#	https://github.com/openstreetmap/merkaartor/issues/307
# 0002: Backport, https://github.com/openstreetmap/merkaartor/pull/316
#	Fix compatibility with GDAL 3.12
#	https://github.com/openstreetmap/merkaartor/issues/314
source=(
  "https://github.com/openstreetmap/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  0001-Fixed-a-crash-on-download-when-no-server-is-loaded.patch
  0002-GDAL-3.12-compatibility.patch
)
sha256sums=('31b73a9d50cb6366a7c15ab36e030467ffe9f7de2be38bad5f3832314d4a5751'
            'facdf3c18e504bd5ac44a3cb9f2a9525e26ff55d66276f8249eb067406730a2a'
            '4e74718b786e12ad3751532e5be7cccd9353e5a7fb9fe550d9a7982ceabb03e3')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGPSD=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
