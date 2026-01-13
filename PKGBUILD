# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.10.0
pkgrel=1
pkgdesc='High productivity build system'
url='https://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python' 'ninja' 'python-tqdm' 'python-typing_extensions')
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz
  ewe-meson
  15297.patch::https://github.com/mesonbuild/meson/pull/15297.patch
)
sha512sums=('4e6ad56e18c7d5b244b94b99c7e42489b8d4e79634abb97607c3f277f74b0c3c1cb043ba48816f444d2960fe96dc38459c404207e415a1401f5fad7c6f5d60e5'
            'e6c3c179c027b54afd9d5340cd14a2e5a291a0e3e9c99bb3ba265f0ae9057adcfae86823536a67e2b1f45309e2c68e0cd9a342c144345c060ad03a450146e297'
            '72a3caefd13758cd6c9061a7cc44a1467e38315463b747ebf6fb45dfd0bf470568a982383c660bf526d49cc81578ccdd379cf11cdd861c1c12ee18d102a7b3b5')

prepare()
{
  _patch_ ${pkgname}-${pkgver}
}

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
