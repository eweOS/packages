# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-hatchling
pkgver=1.24.2
pkgrel=1
pkgdesc="Extensible, standards compliant build backend used by Hatch"
arch=('any')
url="https://github.com/pypa/hatch/tree/master/backend"
_url="https://github.com/pypa/hatch"
license=('MIT')
groups=(python-build-backend)
depends=('python' 'python-packaging' 'python-pathspec' 'python-pluggy'
         'python-editables' 'python-trove-classifiers')
makedepends=('python-build' 'python-installer')
_name=${pkgname/python-/}
source=(
  "${_url}/archive/refs/tags/${_name}-v${pkgver}.tar.gz"
)
sha256sums=('b8e6974a780dc2c5b43676c352f20e19c61a33b7a4e1cb47b05c364ae22f0a8c')

build() {
  cd "hatch-${_name}-v${pkgver}/backend"
  python -m build --wheel --no-isolation
}

package() {
  cd "hatch-${_name}-v${pkgver}/backend"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
