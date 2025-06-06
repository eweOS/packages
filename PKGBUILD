# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-hatch-fancy-pypi-readme
pkgver=25.1.0
pkgrel=1
pkgdesc='Fancy PyPI READMEs with Hatch'
arch=('any')
url='https://github.com/hynek/hatch-fancy-pypi-readme'
license=('MIT')
depends=('python' 'python-hatchling')
makedepends=(
  'git'
  'python-build'
  'python-installer'
)
checkdepends=('python-pytest' 'python-wheel')
source=("$pkgname::git+$url#commit=$pkgver")
sha256sums=('866d3e7774822ef937566172d50463ace2b985e19722503f419f7d9ab790a094')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/src" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
