# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-hatch-vcs
pkgver=0.4.0
pkgrel=1
pkgdesc="Hatch plugin for versioning with your preferred VCS"
url="https://github.com/ofek/hatch-vcs"
license=('MIT')
arch=('any')
depends=('python-hatchling' 'python-setuptools-scm')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/ofek/hatch-vcs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd hatch-vcs
  python -m build -nw
}

check() {
  cd hatch-vcs
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install$site_packages" pytest
}

package() {
  cd hatch-vcs
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
