# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=esbuild
pkgver=0.25.2
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=(go git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6e1a868de7c1b6c672175a1f0eef42bcf04f236a00d21e23dd8935accd80d1accacb53cb1ead0edfabdb0dc0e5440907ee070aa061779c2c9faa57f94935152c')

build() {
    cd "${pkgname}-${pkgver}"
    go build -buildvcs=false ./cmd/esbuild
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
