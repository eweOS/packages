# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd <judd@archlinux.org>

pkgname=nano
pkgver=8.4
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
url="https://www.nano-editor.org"
depends=('ncurses' 'file' 'sh')
makedepends=('linux-headers')
backup=('etc/nanorc')
source=("https://www.nano-editor.org/dist/v8/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d')

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
