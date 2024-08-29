# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gi-docgen
pkgver=2024.1
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
sha256sums=('ea579558f53b569deb1fd10e0095b86667bbb43d35873a1460ad435a3636b7c3')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
