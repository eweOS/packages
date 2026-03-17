# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-markdown
pkgver=3.10.2
pkgrel=1
pkgdesc="Python implementation of John Gruber's Markdown"
arch=('any')
url='https://python-markdown.github.io/'
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-yaml: parse Python in YAML metadata')
checkdepends=('python-yaml')
source=("$pkgname::git+https://github.com/Python-Markdown/markdown#tag=$pkgver")
sha256sums=('160461aa9da737a5dc5007afb320d7028f5c166aef73b45387220404ca21575d')

prepare() {
  _patch_ "$pkgname"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/Markdown-$pkgver.dist-info/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
