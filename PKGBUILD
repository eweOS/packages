# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.11.0
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
# 001: Skip adding rust's self-contained libs with static linking when crt-static arg is disabled.
# 	this problem may cause panic because there are multi musl libs contained.
# 	see: https://github.com/mesonbuild/meson/pull/15646
source=(
  https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz
  001-Fix-self-contained-libs-mistakenly-linked-in-rust.patch
  ewe-meson
)
sha512sums=('9a4c678c523388d51e47ae1f1a506368f539fab0a9c1eb51ae6e148aeb6418ab26bae758c10c4c3d6f41bfc00949003ec52aabbcd7a9dc7bd33de8fa02477926'
            '26fd599b020fd384ba9d6e319c9d029798e4216a3b893bdff73e42f9aaacb334d55774d17656dbaabf3c3da22efbef24fa15d8ac75524bc189b5caee1315a90e'
            'e6c3c179c027b54afd9d5340cd14a2e5a291a0e3e9c99bb3ba265f0ae9057adcfae86823536a67e2b1f45309e2c68e0cd9a342c144345c060ad03a450146e297')

build()
{
  _patch_ "$pkgname-$pkgver"

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
