# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-platformdirs
_name="${pkgname#python-}"
pkgver=4.3.2
pkgrel=1
pkgdesc='A library to determine platform-specific system directories'
arch=('any')
url='https://github.com/platformdirs/platformdirs'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
  'python-appdirs'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2670af8784dd2e7163c3d34b5cd52563acf60e82337c29a85f5d2cfc3f04cbde')

build() {
  cd "$_name-$pkgver"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$(pwd)/src" pytest -v
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${_name}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
