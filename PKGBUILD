# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=draco
pkgver=1.5.7
pkgrel=1
pkgdesc="A library for compressing and decompressing 3D geometric meshes and point clouds"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/google/draco"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bf6b105b79223eab2b86795363dfe5e5356050006a96521477973aba8f036fe1')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    CXXFLAGS+=' -ffat-lto-objects'
    cmake \
        -Bbuild \
        -GNinja \
        -DCMAKE_UNITY_BUILD=ON \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON

    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build install
}
