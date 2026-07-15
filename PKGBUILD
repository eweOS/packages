# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=putty
pkgver=0.84
pkgrel=2
pkgdesc='A terminal integrated SSH/Telnet client'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.chiark.greenend.org.uk/~sgtatham/putty/'
license=('MIT')
depends=('gtk3')
makedepends=('cmake')
source=("https://the.earth.li/~sgtatham/putty/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'putty.desktop'
        'putty.png'
        'putty.xpm'
        'fix-no-x11.patch')
sha256sums=('06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe'
            '4a8af81fe8ac702ad298606076088f237b83beed82cc089a32f314888b67cf2c'
            '93ba8ea8abf942f4de1c6cd167d4b5c2d6246fb1aa39dc49571cc18d167460c1'
            'd65139883171ed0119d9778ff4a89e6a8151a5ae97fcf8dc7cafb59df424377f'
            'a8b5fead3501fc72640dbea759e7d5ef823e6ac2a51b8a41dca095cf13839180')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

build() {
  cmake \
    -B build \
    -S ${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  
  install -D -m0644 "${srcdir}"/putty.desktop "${pkgdir}"/usr/share/applications/putty.desktop
  install -D -m0644 "${srcdir}"/putty.png "${pkgdir}"/usr/share/pixmaps/putty.png
  install -D -m0644 "${srcdir}"/putty.xpm "${pkgdir}"/usr/share/pixmaps/putty.xpm
}
