# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wireguard-tools
pkgver=1.0.20260223
pkgrel=2
pkgdesc='next generation secure network tunnel - tools for configuration'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.wireguard.com/'
license=('GPL-2.0-only')
depends=('bash')
makedepends=('linux-headers')
source=("https://git.zx2c4.com/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha256sums=('af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf')

prepare()
{
  cd ${pkgname}-${pkgver}/
  find contrib/ -name '.gitignore' -delete
}

build()
{
  cd ${pkgname}-${pkgver}/
  make -C src/
}

package()
{
  cd ${pkgname}-${pkgver}/
  make -C src/ \
    DESTDIR="${pkgdir}/" \
    WITH_BASHCOMPLETION=yes \
    WITH_WGQUICK=yes \
    install
  install -d -m0755 "${pkgdir}"/usr/share/${pkgname}/
  cp -r contrib/ "${pkgdir}"/usr/share/${pkgname}/examples/
}
