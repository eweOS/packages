# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pathspec
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc='Utility library for gitignore style pattern matching of file paths'
arch=('any')
url=https://github.com/cpburnz/python-pathspec
license=('MPL-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('adc862a879860f25db0b97b1bef35f737ce0bfa2ae1c38555bbedb17188ecf35')

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
  install -d "$pkgdir"/usr/share/licenses
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname
}
