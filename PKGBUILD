# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pyalpm
pkgver=0.11.1
pkgrel=2
pkgdesc="Python 3 bindings for libalpm"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-or-later')
depends=('python' 'libalpm')
makedepends=('git' 'python-setuptools' 'python-pkgconfig' 'python-build' 'python-installer' 'python-wheel' 'meson-python')
checkdepends=('python-pytest' 'python-pytest-pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver")
sha256sums=('a098f1646e313c8dcd93db69ab8f727cb045717514c9aed1bf4e7be96532189a')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  meson setup builddir
  meson compile -C builddir
  meson test -C builddir -v
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

