# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinxcontrib-serializinghtml
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=2
pkgdesc='Sphinx extension which outputs "serialized" HTML files (json and pickle)'
arch=(any)
url=https://github.com/sphinx-doc/sphinxcontrib-serializinghtml
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-sphinx
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('c3cd51605fc8cc32cdc2b2f91a9c339475c8872370cc1a3f1c490e56b91dda0b')

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
