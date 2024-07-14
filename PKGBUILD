# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd <judd@archlinux.org>

pkgname=nano
pkgver=8.1
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(x86_64 aarch64 riscv64)
license=('GPL')
url="https://www.nano-editor.org"
depends=('ncurses' 'file' 'sh')
makedepends=('linux-headers')
backup=('etc/nanorc')
source=("https://www.nano-editor.org/dist/v8/${pkgname}-${pkgver}.tar.xz")
sha256sums=('93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-color \
    --enable-nanorc \
    --enable-multibuffer
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/doc/sample.nanorc "${pkgdir}"/etc/nanorc
}
