# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pygments
pkgver=2.18.0
pkgrel=1
pkgdesc="Python syntax highlighter"
arch=('any')
url="https://pygments.org/"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-wcag-contrast-ratio'
             'python-build' 'python-installer' 'python-wheel'
             'python-hatchling')
# FIXME: missing dependency
#checkdepends=('python-pytest' 'python-lxml')
source=(https://pypi.org/packages/source/p/pygments/pygments-$pkgver.tar.gz)
sha256sums=('786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199')

build() {
  cd pygments-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pygments-$pkgver
  #PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd pygments-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  mkdir -p "$pkgdir/usr/share/doc"
  install -Dm644 doc/pygmentize.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 external/pygments.bashcomp \
    "$pkgdir/usr/share/bash-completion/completions/pygmentize"
}
