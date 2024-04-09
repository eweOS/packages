# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=mtr
pkgname=(mtr mtr-gtk)
pkgver=0.95
pkgrel=4
pkgdesc='Combines the functionality of traceroute and ping into one tool'
url='https://www.bitwizard.nl/mtr/'
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
depends=('ncurses' 'libcap')
makedepends=('gtk3')
source=(
  https://github.com/traviscross/mtr/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz
  mtr.install
)
sha256sums=('12490fb660ba5fb34df8c06a0f62b4f9cbd11a584fc3f6eceda0a99124e8596f'
            '881705988d847a51d80464ba8575420da19a97c8272e7d59349c40e623f25e65')
install=mtr.install

prepare()
{
  cp -r ${pkgbase}-${pkgver} ${pkgbase}-gtk-${pkgver}
  for variant in "${pkgname[@]}"; do
    pushd ${variant}-${pkgver}
    autoreconf -fiv
    popd
  done
}

build()
{
  for variant in "${pkgname[@]}"; do
    if [ "$variant" == "mtr-gtk" ]; then
      without_gtk3="--with-gtk"
    else
      without_gtk3="--without-gtk"
    fi
    pushd ${variant}-${pkgver}
    ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      ${without_gtk3}
    make
    popd
  done
}

package_mtr()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_mtr-gtk()
{
  depends+=(gtk3)
  provides=(mtr)
  conflicts=(mtr)

  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
