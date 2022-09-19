# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>
# Contributer: graysky <graysky AT archlinux DOT us>
# Contributer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcrossguid
epoch=1
pkgver=0.2.2
pkgrel=3
pkgdesc="Lightweight cross platform C++ GUID/UUID library"
arch=('x86_64')
url="https://github.com/graeme-hill/crossguid"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graeme-hill/crossguid/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
    cd "crossguid-$pkgver"

    cmake . -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    make
}

check(){
    cd "crossguid-$pkgver"
    ./xgtest
}

package() {
    cd "crossguid-$pkgver"
    install -D -m644 libxg.a "${pkgdir}/usr/lib/libxg.a"
    install -D -m644 Guid.hpp "${pkgdir}/usr/include/Guid.hpp"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

