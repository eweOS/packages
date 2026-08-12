# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=nano
pkgver=9.2
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later')
url="https://www.nano-editor.org"
depends=('ncurses' 'file' 'sh')
makedepends=('linux-headers')
backup=('etc/nanorc')
source=("https://www.nano-editor.org/dist/v9/${pkgname}-${pkgver}.tar.xz")
sha256sums=('05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9')

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
