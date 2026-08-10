# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson
pkgver=1.11.2
pkgrel=3
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
sha512sums=('2be37c49c99b7882910956f513c251bd588e5222e2a69c5ee81a7f272bf9cbbb22402c9bc152ebd20ce81a522b4f60a68e39d755e8cd8fc11de5500e37436278'
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
