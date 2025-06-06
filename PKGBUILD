# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-structlog
pkgver=25.4.0
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
sha512sums=('a52a7b3af10abe214f16e870a879027185bd919a741209b394d9d156111964a435b4758dd3aeba9c7358789eba58ca8baa858082922d2f6b922f102396a5a957')

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

