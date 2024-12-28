# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinxcontrib-qthelp
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=2
pkgdesc='Sphinx extension which outputs QtHelp document'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-qthelp
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-defusedxml
  python-pytest
  python-sphinx
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('69dd88a9b06583cb5aeeaa9bd3697870f876e2fbc3c7d4e977bb9b0e012d712d')

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
