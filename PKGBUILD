# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libuv
pkgname=(libuv libuv-docs)
pkgver=1.53.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/libuv/libuv"
license=('MIT')
makedepends=(python-sphinx linux-headers)
# 0001: Downstream, test-sizeof hardcodes glibc NI_MAXHOST and sem_t sizes
# and cannot pass on musl; skip only that test.
# TODO: Upstream a musl-aware size table instead of skipping.
source=(
    "https://dist.libuv.org/dist/v$pkgver/libuv-v$pkgver.tar.gz"
    "0001-test-sizeof-skip-on-musl.patch"
)
sha256sums=('cb0d6dd2128d5a95bd242c6cc982a24fe608fa93da57b6b4ec763b0018c53e64'
            '0cef86025f93de800e1242b8bb656925916b368d083f66c77afc3f033fbaff4f')

prepare() {
    _patch_ "$pkgbase-v$pkgver"
}

build() {
    cd "$pkgbase-v$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr
    make

    cd docs
    # sphinx-copybutton is only used for HTML output; only man pages are packaged.
    make man SPHINXOPTS="-D extensions=manpage"
}

check() {
    cd "$pkgbase-v$pkgver"
    # The build container runs as root; libuv requires this variable to allow it.
    UV_RUN_AS_ROOT=1 make check
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
