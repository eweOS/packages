# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd <judd@archlinux.org>

pkgname=nano
pkgver=6.4
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(x86_64 aarch64)
license=('GPL')
url="https://www.nano-editor.org"
depends=('ncurses' 'file' 'sh')
backup=('etc/nanorc')
source=("https://www.nano-editor.org/dist/v6/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0')

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
