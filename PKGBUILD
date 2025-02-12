# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=putty
pkgver=0.83
pkgrel=1
pkgdesc='A terminal integrated SSH/Telnet client'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.chiark.greenend.org.uk/~sgtatham/putty/'
license=('MIT')
depends=('gtk3')
makedepends=('cmake')
source=("https://the.earth.li/~sgtatham/putty/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'putty.desktop'
        'putty.png'
        'putty.xpm')
sha256sums=('718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6'
            '4a8af81fe8ac702ad298606076088f237b83beed82cc089a32f314888b67cf2c'
            '93ba8ea8abf942f4de1c6cd167d4b5c2d6246fb1aa39dc49571cc18d167460c1'
            'd65139883171ed0119d9778ff4a89e6a8151a5ae97fcf8dc7cafb59df424377f')

build() {
  # By default this builds with support for both, GTK+ and X11.
  # Just the first is fine, so disable X11 (and fix wayland).
  export CFLAGS+=' -DNOT_X_WINDOWS'

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
  
  install -D -m0644 "${srcdir}"/${pkgname}-${pkgver}/LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 "${srcdir}"/putty.desktop "${pkgdir}"/usr/share/applications/putty.desktop
  install -D -m0644 "${srcdir}"/putty.png "${pkgdir}"/usr/share/pixmaps/putty.png
  install -D -m0644 "${srcdir}"/putty.xpm "${pkgdir}"/usr/share/pixmaps/putty.xpm
}

