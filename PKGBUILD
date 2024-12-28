# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinxcontrib-devhelp
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Sphinx extension which outputs Devhelp document'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-devhelp
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
#checkdepends=(
#  python-pytest
#  python-sphinx
#)
source=("git+$url.git#tag=$pkgver")
sha256sums=('9959f8f68824e675389fc68c7b87fe7c390ce4da141fa3b860dad4f5593f869b')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
#  PYTHONPATH="sphinxcontrib/devhelp:$PYTHONPATH" pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"${_name//-/_}"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
