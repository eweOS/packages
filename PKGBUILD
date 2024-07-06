# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spdlog
pkgver=1.14.1
pkgrel=2
pkgdesc='Very fast, header-only/compiled, C++ logging library'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/gabime/spdlog'
license=('MIT')
depends=('fmt')
makedepends=('cmake' 'git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('1586508029a7d0670dfcb2d97575dcdc242d3868a259742b69f100801ab4e16b')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's@// #define SPDLOG_FMT_EXTERNAL@#define SPDLOG_FMT_EXTERNAL@g' include/spdlog/tweakme.h
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S "$pkgname-$pkgver" \
        -DSPDLOG_BUILD_BENCH=OFF \
        -DSPDLOG_FMT_EXTERNAL=ON \
        -DSPDLOG_BUILD_SHARED=ON \
        -DSPDLOG_BUILD_TESTS=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
