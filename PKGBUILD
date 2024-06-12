# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.classes
pkgver=3.4.0
pkgrel=1
pkgdesc='Module for classes manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.classes'
license=('MIT')
depends=('python-more-itertools')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-pytest-enabler' 'python-pytest-mypy' 'python-pip')
conflicts=(python-jaraco)
replaces=(python-jaraco)
source=("https://github.com/jaraco/jaraco.classes/archive/refs/tags/v$pkgver/jaraco.classes-$pkgver.tar.gz")
sha512sums=('dd321db10ffe0e5af0b8d061e2f2cfa42a6f61cc3117a1bdb84e5b403155525f467413279057aecc6fcc2d306dade0f542adb92540d71f525afc19aae717a103')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd "$srcdir/jaraco.classes-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.classes-$pkgver"
  #FIXME: missing dependency
  #python -m pytest
}

package() {
  cd "$srcdir/jaraco.classes-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
