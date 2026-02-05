# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gi-docgen
pkgver=2026.1
pkgrel=1
pkgdesc="Documentation generator for GObject-based libraries"
url="https://gnome.pages.gitlab.gnome.org/gi-docgen/"
arch=(any)
license=("Apache-2.0 OR GPL-3.0-or-later")
depends=(
  python
  python-jinja
  python-magic
  python-markdown
  python-markupsafe
  python-packaging
  python-pygments
  python-typogrify
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+https://gitlab.gnome.org/GNOME/gi-docgen.git#tag=$pkgver")
sha256sums=('462161e122aa6b562efc191fe705147f93f0c2cf66fbcfa987c12e5a74a77589')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  pytest -v
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
