# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tomli-w
pkgver=1.2.0
pkgrel=1
pkgdesc="A lil' TOML writer"
url=https://github.com/hukkin/tomli-w
license=(MIT)
arch=(any)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-tomli
)
source=(git+https://github.com/hukkin/tomli-w.git#tag=$pkgver)
sha256sums=('712e541fa7ee40b95989eb84313e1b8dc6b731cd8f4f8cf75ee9287829739434')

build() {
  cd tomli-w
  python -m build --wheel --no-isolation
}

check() {
  cd tomli-w
  PYTHONPATH="$PWD/src" python -m pytest
}

package() {
  python -m installer --destdir="${pkgdir}" tomli-w/dist/*.whl
  install -Dm 644 tomli-w/LICENSE -t "${pkgdir}"/usr/share/licenses/python-tomli-w/
}
