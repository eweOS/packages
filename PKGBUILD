# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ninja
pkgver=1.10.2
pkgrel=1
pkgdesc='a small build system with a focus on speed'
arch=(x86_64)
url='https://github.com/ninja-build/ninja'
license=(Apache)
depends=(python llvm-libs)
source=("https://github.com/ninja-build/ninja/archive/v${pkgver}.tar.gz")
sha256sums=("ce35865411f0490368a8fc383f29071de6690cbadc27704734978221f25e2bed")


build() {
    cd $pkgname-$pkgver
    ./configure.py --bootstrap
}

package() {
    cd $pkgname-$pkgver
    install -d "${pkgdir}/usr/bin"
    install -m 0755 ninja "${pkgdir}/usr/bin/"
}
