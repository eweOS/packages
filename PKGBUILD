# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=charset_normalizer
pkgname=python-charset-normalizer
pkgver=3.4.4
pkgrel=1
pkgdesc='Encoding and language detection alternative to chardet'
arch=(any)
url=https://github.com/Ousret/charset_normalizer
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('c06418e2d1dc438107c62d9d33b21d09dfac624db305a3ec921cc0ebb7099e8c')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  # Override addopts as they invoke coverage testing
  PYTHONPATH="src" pytest --override-ini="addopts="
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
