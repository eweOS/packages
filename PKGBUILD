# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=esbuild
pkgver=0.27.2
pkgrel=3
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=(go git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e9cea28edb8e0da8ac23fedc9b9b3cbcbe88df18be8ab1dd9f3943ecabee072630c0cca5e1080a77607746798edb9f1f0b560d586621493df4282cffa444f1df')

build() {
    cd "${pkgname}-${pkgver}"
    go build -buildvcs=false ./cmd/esbuild
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
