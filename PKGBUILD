# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gi-docgen
pkgver=2025.4
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
sha256sums=('c127caaeeacbc36cf11a010c44084dab8071471988ad16574cb89d00d03dc9a1')

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
