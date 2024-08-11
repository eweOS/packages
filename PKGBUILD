# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-execnet
pkgver=2.0.2
pkgrel=1
pkgdesc="Rapid multi-Python deployment"
arch=('any')
license=('MIT')
url="https://codespeak.net/execnet"
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
)
checkdepends=(
  'python-pytest'
  'python-pytest-timeout'
)
source=("git+https://github.com/pytest-dev/execnet.git#tag=v$pkgver")
sha512sums=('d6971ebdb31e70c4a1fb6f554f30376f3e9bf91c083be0e222299d22a13b2e8ca821795e44123863ee5dad9c98ca45c8cac1f38be478a7d46a2310aa0d2be5c7')

build() {
  cd execnet
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd execnet
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv testing
}

package() {
  cd execnet
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
