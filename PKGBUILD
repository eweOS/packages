# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=charset_normalizer
pkgname=python-charset-normalizer
pkgver=3.4.0
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
sha256sums=('b7eabd6ac3d67a35d54db524f34c9798996423bfc775b2e0a1522317d433f628')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts="
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
