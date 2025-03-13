# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-structlog
pkgver=25.2.0
pkgrel=1
pkgdesc="Structured Logging for Python"
url="https://www.structlog.org"
# https://github.com/hynek/structlog/blob/24.2.0/pyproject.toml#L14
license=('MIT OR Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer'
             'python-hatchling' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
#checkdepends=('python-pytest' 'python-freezegun' 'python-pretend' 'python-simplejson'
#              'python-twisted' 'python-rapidjson' 'python-greenlet' 'python-pytest-asyncio'
#              'python-rich')
optdepends=(
  'python-greenlet: for greenlet support in structlog.threadlocal (deprecated)'
  'python-twisted: for structlog.twisted'
  'python-rich: for structlog.dev'
)
source=("git+https://github.com/hynek/structlog.git#tag=$pkgver")
sha512sums=('d8ce7d5548db1fe149f642d414fc61b53b53989706f7e8ddbdec708653a96562754fb82f6968965a1fc6c6f372266ac1d6cefcd86a302155903d0f2469f88566')

build() {
  cd structlog
  python -m build --wheel --no-isolation
}

check() {
  cd structlog
  # Install to a temporary root for test_packaging
  #pyver=$(python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))")
  #python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  #PYTHONPATH="$PWD/tmp_install/usr/lib/python$pyver/site-packages" pytest tests
}

package() {
  cd structlog
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir"/usr/share/licenses/$pkgname
}

