# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tomli-w
pkgver=1.0.0
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
sha256sums=('51dce731f4bad055897c87bf8e0f46444907925c3840753d504712cb2a0a6566')

build() {
  cd tomli-w
  python -m build --wheel --no-isolation
}

check() {
  cd tomli-w
  python -m pytest
}

package() {
  python -m installer --destdir="${pkgdir}" tomli-w/dist/*.whl
  install -Dm 644 tomli-w/LICENSE -t "${pkgdir}"/usr/share/licenses/python-tomli-w/
}
