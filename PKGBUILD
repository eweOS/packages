# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-enabler
pkgver=3.4.0
pkgrel=1
pkgdesc='Enable installed pytest plugins'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/pytest-enabler'
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-pytest' 'python-toml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-pytest-mypy' 'python-pytest-ruff' 'python-pytest-cov')
source=("git+https://github.com/jaraco/pytest-enabler.git#tag=v$pkgver")
sha512sums=('8be35c94671d858c3164bcc9289f6b93059007942fc73903d056daa48f7e529f46cdca5d348c089484e17f3c84331f8c2c666c73baff4618d3dc215835f40193')

prepare() {
  cd ${pkgname#python-}
  # Revert MIT license deletion
  git revert -n 9a81db3c77bc106017dcd4b0853a5a94f43ae33c
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation  --skip-dependency-check
}

check() {
  cd ${pkgname#python-}
  # TODO: pytest dependency
  #PYTHONPATH="$PWD" pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
