# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=esbuild
pkgver=0.25.3
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=(go git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f23c58564742d6857e67ebd02a5d0425a2122487fa639a05202d7987cc3f716c549508f77681e0ba579f7f65906ede446df08b3b911012c6ceb635704757c545')

build() {
    cd "${pkgname}-${pkgver}"
    go build -buildvcs=false ./cmd/esbuild
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
