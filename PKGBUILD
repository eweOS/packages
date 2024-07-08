# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=(go go-doc)
epoch=2
pkgver=1.22.5
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64 aarch64 riscv64)
url='https://golang.org/'
license=(BSD)
makedepends=(go git)
replaces=(go-pie)
provides=(go-pie)
options=(!strip staticlibs)
source=("https://go.dev/dl/go${pkgver}.src.tar.gz" remove-use-gold.patch)
sha256sums=('ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6'
            'dce8539658ba86658c20e4bc039af403e4f7a4c3ef44838fbe0e92a33a9e03ae')

prepare()
{
  # do not try to use gold in arm64, we use mold
  _patch_ $pkgname
}

build()
{
  case $CARCH in
    x86_64)
      export GOARCH=amd64
      export GOAMD64=v1 # make sure we're building for the right x86-64 version
      ;;
    aarch64)
      export GOARCH=arm64
      ;;
    riscv64)
      export GOARCH=riscv64
      ;;
  esac
  export GOAMD64=v1 # make sure we're building for the right x86-64 version
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export CC=/usr/bin/cc

  cd "$pkgname/src"
  ./make.bash -v
}

check()
{
  export GO_TEST_TIMEOUT_SCALE=3

  # TODO: fix tests on riscv64
  if [ $CARCH != riscv64 ]; then
    cd $pkgname/src
    # syscall no privilege, cgo test failed, see https://github.com/golang/go/issues/39857
    # +plugins: https://github.com/golang/go/issues/46560
    ./run.bash --no-rebuild -run '!(^cgo_test$|syscall|runtime|plugin)'
  fi
}

package_go()
{
  cd $pkgname

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" \
    "$pkgdir/usr/lib/go/pkg/linux_*_"{dynlink,race}

  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  # We can't strip all binaries and libraries,
  # as that also strips some testdata directories and breaks the tests.
  # Just strip the packaged binaries as a compromise.
  strip $STRIP_BINARIES "$pkgdir/usr/lib/go"{/bin/*,/pkg/tool/*/*}

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" \
    "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build

  # https://github.com/golang/go/issues/57179
  install -Dm644 go.env "$pkgdir/usr/lib/go/go.env"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_go-doc()
{
  options=(docs)
  install -d $pkgdir/usr/{lib,share/doc}/go
  cp -r $srcdir/go/doc/* "$pkgdir/usr/share/doc/go"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"
}
