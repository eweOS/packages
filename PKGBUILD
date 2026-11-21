# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=assimp
pkgver=6.0.6
pkgrel=1
pkgdesc="Library to import various well-known 3D model formats in an uniform manner"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'ninja')
url='https://github.com/assimp/assimp'
source=("$pkgname-$pkgver.tar.gz::https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
sha512sums=('58c34e74721feb4cd2951c317ec08653e574d1d9fd9551c2752f0733482b602e51b27da379d3ff3a596eba77a6366efb02e6d98cc3f244faa946b7634acaff60')

build() {
  cd ${pkgname}-${pkgver}

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DASSIMP_BUILD_SAMPLES=OFF \
    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
    -DASSIMP_BUILD_ASSIMP_TOOLS=ON \
    -DASSIMP_BUILD_ZLIB=OFF
  ninja -C build
}

package()  {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

