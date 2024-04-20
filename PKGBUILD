# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pyalpm
pkgver=0.10.9
pkgrel=1
pkgdesc="Python 3 bindings for libalpm"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-or-later')
depends=('python' 'pacman')
makedepends=('git' 'python-setuptools' 'python-pkgconfig' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

