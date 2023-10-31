# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.2.3
pkgrel=1
pkgdesc='High productivity build system'
url='https://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python' 'ninja')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz
  ewe-meson)
sha512sums=('cdcadc731effc1ffb2de98b795ba37955f934ed9b54b9f7f3ac5fe96ab33268d4de4fce734a4c2ef7d2ecc5051616df127e1f8665e197ff954310bf1483b81fc'
            'e6c3c179c027b54afd9d5340cd14a2e5a291a0e3e9c99bb3ba265f0ae9057adcfae86823536a67e2b1f45309e2c68e0cd9a342c144345c060ad03a450146e297')

build()
{
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package()
{
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dt "${pkgdir}/usr/share/bash-completion/completions" -m644 data/shell-completions/bash/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # eweOS packaging helper
  install -D ../ewe-meson -t "${pkgdir}/usr/bin"
}
