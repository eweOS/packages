# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinxcontrib-htmlhelp
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=2
pkgdesc='Sphinx extension which renders HTML help files'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-htmlhelp
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-html5lib
  python-pytest
  python-sphinx
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('df84d318ff5236516dbbb0c96e02b6dad271b5259c6d5447c4c841dabbc50309')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  pytest
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
