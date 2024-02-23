# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuv
pkgver=1.48.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/libuv/libuv"
license=('custom')
source=(https://dist.libuv.org/dist/v$pkgver/libuv-v$pkgver.tar.gz)
sha256sums=('7f1db8ac368d89d1baf163bac1ea5fe5120697a73910c8ae6b2fffb3551d59fb')

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

