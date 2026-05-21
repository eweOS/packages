# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spdlog
pkgver=1.17.0
pkgrel=2
pkgdesc='Very fast, header-only/compiled, C++ logging library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/gabime/spdlog'
license=('MIT')
depends=('fmt')
makedepends=('cmake' 'git')
# 0001: Backport 0f7562a0f927 ("tests: timezone: Provide DST rules when setting
#	TZ on POSIX systems (#3542)"), to fix test_timezone on musl systems.
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    0001-tests-timezone-Provide-DST-rules-when-setting-TZ-on-.patch
)
sha256sums=('d8862955c6d74e5846b3f580b1605d2428b11d97a410d86e2fb13e857cd3a744'
            '004877d02579ed5bcdf8a4d291a83c92608dc45bcc3fb8b25e52d4439a3b76af')

prepare() {
   _patch_ "$pkgname-$pkgver"

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
        -DSPDLOG_BUILD_EXAMPLE=OFF \
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
