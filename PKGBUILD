# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncnn
pkgver=20250503
pkgrel=2
pkgdesc='High-performance neural network inference framework optimized for the mobile platform'
url='https://github.com/Tencent/ncnn'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD')
depends=('vulkan-icd-loader')
makedepends=('git' 'cmake' 'glslang' 'ninja' 'protobuf' 'vulkan-headers')
optdepends=('protobuf: for onnx2ncnn')
source=("git+https://github.com/Tencent/ncnn.git#tag=$pkgver")
sha256sums=('4cdc3f0a30c5eb569ebc4a7a45a2f28e10a1a8bfb8984d25e812c8e0486e3bb2')

build() {
    if check_option lto y; then
        _LTO_FLAGS="-DNCNN_ENABLE_LTO=ON"
    else
        _LTO_FLAGS="-DNCNN_ENABLE_LTO=OFF"
    fi
    cmake -B build -S $pkgname \
        -GNinja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNCNN_SHARED_LIB=ON \
        -DNCNN_VULKAN=ON \
        -DNCNN_SYSTEM_GLSLANG=ON \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -Wno-dev \
        $_LTO_FLAGS
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$srcdir"/ncnn/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
