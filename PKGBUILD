# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=gitpython
pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.1.43
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
sha512sums=('2204c41158630d501fa330f02474b57fd113d82ee5da972f95ab6fe69ae6c9bc477211ee751959d545c6eac9433bf50dbf81992d851af5b9904db3ca526cd742')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local deselected=(
    --deselect git/ext/gitdb/gitdb/test/db/test_git.py::TestGitDB::test_reading
    --deselect git/ext/gitdb/gitdb/test/db/test_ref.py::TestReferenceDB::test_writing
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_correctness
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_loose_correctness
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_pack_random_access
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack_streaming.py::TestPackStreamingPerformance::test_pack_writing
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack_streaming.py::TestPackStreamingPerformance::test_stream_reading
    --deselect git/ext/gitdb/gitdb/test/performance/test_stream.py::TestObjDBPerformance::test_large_data_streaming
    --deselect git/ext/gitdb/gitdb/test/test_stream.py::TestStream::test_compressed_writer
    --deselect git/ext/gitdb/gitdb/test/test_example.py::TestExamples::test_base
    --deselect test/test_submodule.py::TestSubmodule::test_git_submodules_and_add_sm_with_new_commit
    --deselect test/test_submodule.py::TestSubmodule::test_list_only_valid_submodules
    --deselect test/performance/test_streams.py::TestObjDBPerformance::test_large_data_streaming
    --deselect test/test_git.py::TestGit::test_refresh_with_good_relative_git_path_arg
    --deselect test/test_base.py::TestBase::test_with_rw_remote_and_rw_repo
    --deselect test/test_remote.py::TestRemote::test_base
    # https://github.com/gitpython-developers/GitPython/issues/1797
    --ignore test/test_index.py
  )

  cd $_name
  export TRAVIS="VERY CONVENIENT"

  # Use a fake HOME directory to avoid messing up your Git config
  mkdir -p "$srcdir/testdata"
  export HOME="$srcdir/testdata"

  git config --global user.name "Test User"
  git config --global user.email "test@user.org"

  # Some tests assume the default name
  git config --global init.defaultbranch master

  ./init-tests-after-clone.sh
  PYTHONDONTWRITEBYTECODE=1 pytest -vv -c /dev/null "${deselected[@]}"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
