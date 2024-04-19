# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=setuptools_scm
pkgname=python-setuptools-scm
pkgver=8.0.4
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata"
arch=('any')
url="https://github.com/pypa/setuptools_scm"
license=('MIT')
depends=('python-packaging' 'python-setuptools' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
#checkdepends=('mercurial' 'python-pip' 'python-pytest' 'python-rich')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # FIXME: test errors
  #test-env/bin/python -m pytest -vk 'not test_not_owner' || :
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
