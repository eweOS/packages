# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tomli-w
pkgver=1.1.0
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
sha256sums=('96f841bb4ccb37ba5d1b0c6654be454b42ad2381ace5f574ee83e91b048024c4')

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
