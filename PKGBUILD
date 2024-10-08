# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xcur2png
pkgver=0.7.1
pkgrel=1
pkgdesc='Convert X cursors to PNG images'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/eworm-de/xcur2png'
license=('GPL')
depends=('libpng' 'libxcurcommon-compat')
source=("https://github.com/eworm-de/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '0001-fix-wrong-math.patch'
        '0002-fix-implicit-int.patch')
sha256sums=('bc6a062fdb48615a7159ed56ef3d2011168cd8a9decaf1d8a4e316d3064132c9'
            '224cf894c53eeb647a696ff311054cecf1a3dfeb10f49d96293c8bfeba4b88e9'
            '996babbc2944be169a638195383a89e4946d85bcdd4d833e7e7942a25e04e744')

prepare() {
  _patch_ "${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
