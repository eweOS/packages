# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=gitdb
pkgdesc="A pure-Python git object database"
pkgname=python-gitdb
pkgver=4.0.11
pkgrel=1
url="https://github.com/gitpython-developers/gitdb"
license=(BSD-3-Clause)
arch=(any)
depends=(
  git
  python
  python-smmap
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=("git+$url#tag=$pkgver")
sha512sums=('1358b271896c26fcf526cbede86e41c2bccae7a184a2a2e48943afafc715ebfe68ef7e0c1a001a6253320aaa30041c42e6e299809dd62ee032b64058ee0e73c3')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

# some tests need to be disabled, because of coupling with the project
# repository: https://github.com/gitpython-developers/gitdb/issues/51
# also: https://github.com/gitpython-developers/gitdb/issues/70
check() {
  cd $_name
  local TEST_TMPDIR=$(mktemp -d)
  (
    cd "$TEST_TMPDIR"
    git init
    git config user.name "Test User"
    git config user.email "test@user.org"
    for commit in {1..50}; do
      touch "file$commit"
      git add "file$commit"
      git commit -m "file$commit"
    done
  )
  export GITDB_TEST_GIT_REPO_BASE="$TEST_TMPDIR/.git"
  pytest -vv -k "not test_pack_writing and not test_compressed_writer and not test_large_data_streaming"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
