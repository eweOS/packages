# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-markdown
pkgver=3.7
pkgrel=1
pkgdesc="Python implementation of John Gruber's Markdown"
arch=('any')
url='https://python-markdown.github.io/'
license=('BSD')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-yaml: parse Python in YAML metadata')
checkdepends=('python-yaml')
source=("$pkgname::git+https://github.com/Python-Markdown/markdown#tag=$pkgver")
sha256sums=('f263f42a34d1144f77beb9beab7935837e08c1c74325416a1b6c11b88388103a')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  [[ $(python -c "import markdown; print(markdown.__version__)") == "$pkgver" ]]
  [[ $(python -c "import markdown; print(markdown.markdown('*test*'))") == "<p><em>test</em></p>" ]]

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
