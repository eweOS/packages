# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-pacman
pkgver=0.1.1
pkgrel=1
pkgdesc="pacman db pytest fixture"
arch=('any')
license=('MIT')
url="https://gitlab.archlinux.org/archlinux/pytest-pacman"
depends=(python python-pytest python-setuptools)
makedepends=(python-build python-installer python-wheel python-flit-core git)
source=(git+https://gitlab.archlinux.org/archlinux/pytest-pacman.git#tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd pytest-pacman

  python -m build --wheel --no-isolation
}

package() {
  cd pytest-pacman

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
