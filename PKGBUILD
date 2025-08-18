# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swappy
pkgver=1.7.1
pkgrel=1
license=('MIT')
pkgdesc='A Wayland native snapshot editing tool'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/jtheoof/swappy'
depends=('cairo' 'gtk3' 'pango')
optdepends=('wl-clipboard: for persistent clipboard'
            'otf-font-awesome: to draw paint icons')
makedepends=('meson' 'scdoc')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4bfa51eb7073dd272aba21c545d416b37e53983430b310a30d12b5d754f7db62')

build() {
    cd "${pkgname}-${pkgver}"
    ewe-meson build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
