# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.12.0
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
sha512sums=('776efa8e5c490285925738d0836474b309e43c5f12af9f1e61d0457c2f4c1d4c197fcc3fcb0166b523e1051bc0e37d2ef4e10f4f703e562278227805e311e0ef'
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
