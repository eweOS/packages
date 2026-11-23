# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pyalpm
pkgver=0.12.0
pkgrel=1
pkgdesc="Python 3 bindings for libalpm"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL-3.0-or-later')
depends=('python' 'libalpm')
makedepends=('git' 'python-setuptools' 'python-pkgconfig' 'python-build' 'python-installer' 'python-wheel' 'meson-python')
checkdepends=('python-pytest' 'python-pytest-pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver")
sha256sums=('7d4b8f0329c93970de83df6586e8d55b4b7ecd1c0dc369267e93e9272349ab36')

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

