# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncnn
pkgver=20240820
pkgrel=1
pkgdesc='High-performance neural network inference framework optimized for the mobile platform'
url='https://github.com/Tencent/ncnn'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD')
depends=('vulkan-icd-loader')
makedepends=('git' 'cmake' 'glslang' 'ninja' 'protobuf' 'vulkan-headers')
optdepends=('protobuf: for onnx2ncnn')
source=("git+https://github.com/Tencent/ncnn.git#tag=$pkgver")
sha256sums=('22002d9f6b90b9e7f38ed989bb0df1bd790022d435534156dcd3e9ffed45c1c4')

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
