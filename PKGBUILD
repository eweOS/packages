# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.12.1
pkgrel=1
pkgdesc='High productivity build system'
url='https://mesonbuild.com/'
arch=('any')
license=('Apache-2.0')
depends=('bash' 'python' 'ninja' 'python-tqdm' 'python-typing_extensions')
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz
  ewe-meson
)
sha512sums=('64c75f9e4165e35059d560c8bb1e13f61893e391396974bf7b8b229491cd712f81e69d8ccabc55e2b49b1268d957ac8d365c258fce3e2c65c7634d140612da02'
            'e03eb255d1cc59a012042a56feae28f5113643eb2ba11acbe83c264de81d3a7d2b967af1aee66e129be127f6e3e9016f2b8953195c62d225283461cebdd6102e')

build()
{
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package()
{
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dt "${pkgdir}/usr/share/bash-completion/completions" -m644 data/shell-completions/bash/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  _install_license_ COPYING

  # eweOS packaging helper
  install -D ../ewe-meson -t "${pkgdir}/usr/bin"
}
