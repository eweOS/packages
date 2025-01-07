# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=gitdb
pkgdesc="A pure-Python git object database"
pkgname=python-gitdb
pkgver=4.0.12
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
sha512sums=('43e940278a5825368bd33618a196496df75e73c2e79dc152f51c2783d08f22891d19707ebe1a15acf62c1e2cfa4e32b2f884ed9819f85908596b5889c7e477c1')

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
