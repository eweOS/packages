# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jinja
_name="${pkgname#python-}"
pkgver=3.1.3
pkgrel=1
pkgdesc="A simple pythonic template language written in Python"
arch=('any')
url="https://palletsprojects.com/p/jinja/"
license=('BSD-3-Clause')
depends=('python' 'python-markupsafe')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
optdepends=('python-babel: for i18n support')
checkdepends=('python-pytest')
source=($_name-$pkgver.tar.gz::https://github.com/pallets/jinja/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('fe349bfd610cba6e688274df6eda339a60a59189cb114cd769ecde49f9a5dcbe')

prepare() {
  cd $_name-$pkgver
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # https://github.com/pypa/setuptools/issues/2466
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=build/lib pytest \
    --deselect tests/test_loader.py::test_package_dir_list \
    --deselect tests/test_loader.py::test_package_dir_source \
    --deselect tests/test_loader.py::test_package_file_list \
    --deselect tests/test_loader.py::test_package_file_source \
    --deselect tests/test_loader.py::test_package_zip_list \
    --deselect tests/test_loader.py::test_package_zip_omit_curdir \
    --deselect tests/test_loader.py::test_package_zip_source
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
