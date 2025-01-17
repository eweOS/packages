# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=merkaartor
pkgver=0.20.0
pkgrel=3
pkgdesc='OpenStreetMap editor'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='http://merkaartor.be/'
license=('GPL2')
depends=('exiv2' 'gdal' 'hicolor-icon-theme' 'qt6-svg' 'qt6-networkauth' 'qt6-5compat' 'protobuf')
makedepends=('qt6-tools' 'cmake')
source=(
  "https://github.com/openstreetmap/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "fix-crash.patch::https://github.com/openstreetmap/merkaartor/commit/61fac7791e2c17be946ae54d2f485f02732ac40a.patch"
)
sha256sums=('31b73a9d50cb6366a7c15ab36e030467ffe9f7de2be38bad5f3832314d4a5751'
            'facdf3c18e504bd5ac44a3cb9f2a9525e26ff55d66276f8249eb067406730a2a')

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
