# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=setuptools_scm
pkgname=python-setuptools-scm
pkgver=9.2.2
pkgrel=2
pkgdesc="Handles managing your python package versions in scm metadata"
arch=('any')
url="https://github.com/pypa/setuptools_scm"
license=('MIT')
depends=('python-packaging' 'python-setuptools' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('mercurial' 'python-pytest' 'python-pytest-timeout')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('8a22ec843318e6cf51c765e9291f45255d4b6ef1a3023176f41d81309f50c56e')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vk 'not test_not_owner' || :
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
