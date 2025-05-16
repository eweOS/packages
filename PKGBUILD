# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=esbuild
pkgver=0.25.4
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=(go git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('931ec3b78c77ef95a4b1ce72e67beefb31688c50412aa5d39c5ff1c49f66d507ea4eac7953758a11d80d3da2d7528d1b9c1851153feec1c0a530123035d61340')

build() {
    cd "${pkgname}-${pkgver}"
    go build -buildvcs=false ./cmd/esbuild
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
