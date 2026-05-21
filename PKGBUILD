# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=roman-numerals
pkgname=python-roman-numerals-py
pkgver=3.1.0
pkgrel=2
pkgdesc='Manipulate well-formed Roman numerals'
arch=(any)
url=https://github.com/AA-Turner/roman-numerals/tree/master/python
license=('0BSD OR CC0-1.0')
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-pytest)
source=("git+https://github.com/AA-Turner/roman-numerals.git#tag=v$pkgver")
sha256sums=('fd42d3f0dca78981111ebc601635881dd4aeb7471e755aab370135a7cc4a6ac4')

prepare() {
  cd $_name
  cp LICENCE.rst python/
}

build() {
  cd $_name/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name/python
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/roman_numerals_py-$pkgver.dist-info/licenses/LICENCE.rst \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENCE.rst

  cd $_name/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}

