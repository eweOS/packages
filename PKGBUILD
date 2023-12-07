# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuv
pkgver=1.47.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/libuv/libuv"
license=('custom')
source=(https://dist.libuv.org/dist/v$pkgver/libuv-v$pkgver.tar.gz)
sha256sums=('20c37a4ca77a2107879473c6c8fa0dc1350e80045df98bfbe78f7cd6d7dd2965')

build() {
    cd $pkgname-v$pkgver
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd $pkgname-v$pkgver
    # packaging env: use root
    make check || true
}

package() {
    cd $pkgname-v$pkgver

    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 AUTHORS \
        "$pkgdir"/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 README.md \
        "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 ChangeLog \
        "$pkgdir"/usr/share/doc/$pkgname/ChangeLog
}

