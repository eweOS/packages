# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=nano
pkgver=9.0
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later')
url="https://www.nano-editor.org"
depends=('ncurses' 'file' 'sh')
makedepends=('linux-headers')
backup=('etc/nanorc')
source=("https://www.nano-editor.org/dist/v9/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde')

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
