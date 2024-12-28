# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=alabaster
pkgname=python-sphinx-alabaster-theme
pkgver=1.0.0
pkgrel=1
pkgdesc='Light, configurable Sphinx theme'
arch=(any)
url=https://github.com/sphinx-doc/alabaster
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('9cd5e5050dbc62f8298f9719f5768f10ed69ffd812864b087c081e413685ea84')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
