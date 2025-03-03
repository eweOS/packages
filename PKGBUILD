# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gi-docgen
pkgver=2025.3
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
source=("git+https://gitlab.gnome.org/GNOME/gi-docgen.git#tag=$pkgver")
sha256sums=('db0157e43e87ea64358d35f6133f4931c8347fb7192ca74162fb9eaceb8804d6')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
