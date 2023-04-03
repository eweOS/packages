# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtr
pkgver=0.95
pkgrel=2
pkgdesc='Combines the functionality of traceroute and ping into one tool'
url='https://www.bitwizard.nl/mtr/'
arch=(x86_64 aarch64)
license=('GPL2')
depends=('ncurses' 'libcap')
source=(
  https://github.com/traviscross/mtr/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  mtr.install
)
sha256sums=('12490fb660ba5fb34df8c06a0f62b4f9cbd11a584fc3f6eceda0a99124e8596f'
            '881705988d847a51d80464ba8575420da19a97c8272e7d59349c40e623f25e65')

install=mtr.install

build()
{
  cd ${pkgbase}-${pkgver}
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package()
{
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
