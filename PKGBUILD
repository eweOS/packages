# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-lark-parser
pkgver=1.2.2
pkgrel=1
pkgdesc='A modern parsing library'
arch=('any')
url='https://github.com/lark-parser/lark'
license=('MIT')
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-tzlocal'
  'python-atomicwrites'
  'python-regex'
)
optdepends=(
  'python-atomicwrites: for atomic_cache'
  # 'python-interegular: for interegular support'  # TODO: package
  'python-regex: for regex support'
  # 'python-js2py: for nearley support', # unmaintained and incompatible with Python 3.13
)
provides=('python-lark')
source=(
  "$pkgname::git+$url#tag=$pkgver"
  'github.com-Hardmath123-nearley::git+https://github.com/Hardmath123/nearley'
)
sha512sums=('f20915d7c94a774f04679949d8a302cceda0408fec1aa02c68aaed2bb4855fd1de0a2b05b48b6ceed842aa64663eb42e3ea570ae5ff05836af3fd3cc36b274e7'
            'SKIP')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.tests/test_nearley/nearley.url "$srcdir/github.com-Hardmath123-nearley"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/lark-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
