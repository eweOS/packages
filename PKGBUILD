# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=esbuild
pkgver=0.25.5
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=(go git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('70ca6398f026b67d0b32fd17652dbfe13e8de741a9017555d499a0e606279b0ad4536f1912d6aacc9c41ac518ef5421a07a42b957a028f8f95dc5e415dbaa2f0')

build() {
    cd "${pkgname}-${pkgver}"
    go build -buildvcs=false ./cmd/esbuild
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
