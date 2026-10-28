# Maintainer: Yukari Chiba <i@0x7f.cc>

_pypiname=wheel
pkgname=python-wheel
pkgver=0.48.0
pkgrel=1
pkgdesc="A built-package format for Python"
arch=(any)
url="https://pypi.python.org/pypi/wheel"
license=('MIT')
depends=('python-packaging')
optdepends=('python-keyring: for wheel.signatures'
            'python-xdg: for wheel.signatures')
makedepends=('python-build' 'python-flit-core' 'python-installer')
# Missing python-flit (soft dependency)
checkdepends=('python-jsonschema' 'python-pytest' 'python-xdg'
	      'python-pytest-cov' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/wheel/archive/$pkgver.tar.gz")
sha512sums=('2eb1b9d8f24b9f7221d24a49b54352f001df778172828d7d58626fd5b5463109cef7fbbdc48548c128b8cdf99a4b76a833f4092d758239375ede7285dfa7c701')

build() {
  cd wheel-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it
  cd wheel-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest -v
}

package() {
  cd wheel-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE.txt
}
