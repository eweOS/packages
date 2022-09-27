# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fswatch
pkgver=1.17.1
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends"
arch=("x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPL')
depends=('llvm-libs')
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    # maybe change to cmake in future
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
