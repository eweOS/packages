# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=gitpython
pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.2.1
pkgrel=1
url="https://github.com/gitpython-developers/gitpython"
license=(BSD-3-Clause)
arch=(any)
depends=(
  git
  python
  python-gitdb
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-ddt
  python-pytest
  python-pytest-mock
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('df6b2bd5fd2501b8ff41ac153a068ecdba65bc8105df9de855251d2965f4f87abce9712c4ad662da35fbd107b4226ce88f60351434aac8409dc3e79765aff492')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local deselected=(
    --deselect test/test_submodule.py::TestSubmodule::test_git_submodules_and_add_sm_with_new_commit
    --deselect test/test_submodule.py::TestSubmodule::test_list_only_valid_submodules
    --deselect test/performance/test_streams.py::TestObjDBPerformance::test_large_data_streaming
    --deselect test/test_git.py::TestGit::test_refresh_with_good_relative_git_path_arg
    --deselect test/test_base.py::TestBase::test_with_rw_remote_and_rw_repo
    --deselect test/test_remote.py::TestRemote::test_base
    # https://github.com/gitpython-developers/GitPython/issues/1797
    --ignore test/test_index.py
  )

  # failed when running under root
  [ "$UID" = 0 ] && \
    deselected+=(--deselect test/test_util.py::TestRmtree::test_does_not_wrap_perm_error_unless_enabled)

  cd $_name
  export TRAVIS="VERY CONVENIENT"
  # avoid `error: could not lock config file /dev/null: Permission denied` from git
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git config --global user.name "Test User"
  git config --global user.email "test@user.org"
  ./init-tests-after-clone.sh
  # Restrict collection to GitPython tests; gitdb and smmap are separate projects.
  PYTHONDONTWRITEBYTECODE=1 pytest -vv -c /dev/null --rootdir=. "${deselected[@]}" test
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
