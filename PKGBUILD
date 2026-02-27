# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libuv
pkgname=(libuv libuv-docs)
pkgver=1.52.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/libuv/libuv"
license=('MIT')
makedepends=(python-sphinx linux-headers)
source=(https://dist.libuv.org/dist/v$pkgver/libuv-v$pkgver.tar.gz)
sha256sums=('19fd091a582c39c7ea26dcbb40a7d2e7cf095b070a757b3c32c05de6cfed6638')

build() {
    cd "$pkgbase-v$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr
    make

    cd docs
    make man
}

check() {
    cd "$pkgbase-v$pkgver"
    # packaging env: use root
    make check || true
}

package_libuv() {
    depends=(musl)

    cd "$pkgbase-v$pkgver"
    make DESTDIR="$pkgdir" install
    _install_license_ LICENSE
    install -Dm644 AUTHORS \
        "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 ChangeLog \
        "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
}

package_libuv-docs() {
    license=('CC-BY-4.0')
    pkgdesc="$pkgdesc (documentaton)"

    install -Dm 644 "$pkgbase-v$pkgver/docs/build/man/libuv.1" \
    	"$pkgdir/usr/share/man/man3/libuv.3"
}
