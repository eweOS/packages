# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pathspec
_name=${pkgname#python-}
pkgver=0.12.1
pkgrel=1
pkgdesc='Utility library for gitignore style pattern matching of file paths'
arch=('any')
url=https://github.com/cpburnz/python-pathspec
license=('MPL2')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m unittest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
