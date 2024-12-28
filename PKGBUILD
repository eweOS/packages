# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinxcontrib-applehelp
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Sphinx extension which outputs Apple help books'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-applehelp
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
sha256sums=('bc59644a9e451fe52122e18f5428a375eb0a310328d29ae918496bea578f5a2f')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
#  pytest
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
