# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.2
pkgrel=1
pkgdesc="ucontext function implementations"
arch=("x86_64")
url="https://github.com/kaniini/libucontext"
license=('ISC')
depends=('musl')
source=("https://distfiles.dereferenced.org/libucontext/libucontext-${pkgver}.tar.xz")
sha512sums=('SKIP')
_carch=x86_64

build(){
    cd ${pkgname}-${pkgver}
    make ARCH="${_carch}"
}

check(){
    cd ${pkgname}-${pkgver}
    make ARCH="${_carch}" check
}

package(){
    cd ${pkgname}-${pkgver}
    make ARCH="${_carch}" DESTDIR=${pkgdir} install
    mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/
    rm -r ${pkgdir}/lib
}

