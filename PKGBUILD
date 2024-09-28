# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=assimp
pkgver=5.4.2
pkgrel=1
pkgdesc="Library to import various well-known 3D model formats in an uniform manner"
arch=('x86_64' 'aarch64' 'riscv64')
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'ninja')
url='https://github.com/assimp/assimp'
source=("$pkgname-$pkgver.tar.gz::https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
sha512sums=('4bfcc3a1b5a0cf3f382560564cac67088e13c62500c3c77dcef03811e67debe72ff318f5ed145b204d5017b56cb4293f3fe14b4060ca193813cef42b12eebe9d')

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

