# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Martí <mvdan@mvdan.cc>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=(go go-doc)
epoch=2
pkgver=1.19.1
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64 aarch64)
url='https://golang.org/'
license=(BSD)
makedepends=(go git)
replaces=(go-pie)
provides=(go-pie)
options=(!strip staticlibs)
source=("https://go.dev/dl/go${pkgver}.src.tar.gz"
  0001-runtime-cgo-add-fno-stack-protector-to-CFLAGS.patch)
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd $pkgname
  patch -p1 < $srcdir/0001-runtime-cgo-add-fno-stack-protector-to-CFLAGS.patch
}

build()
{
  export GOARCH=amd64
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

  cd $pkgname/src
  # syscall no privilege, cgo test failed, see https://github.com/golang/go/issues/39857
  ./run.bash --no-rebuild -run '!(^cgo_test$|syscall)'
}

package_go()
{
  cd $pkgname

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" \
    "$pkgdir/usr/lib/go/pkg/linux_amd64_"{dynlink,race}

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_go-doc()
{
  options=(docs)
  install -d $pkgdir/usr/{lib,share/doc}/go
  cp -r $srcdir/go/doc/* "$pkgdir/usr/share/doc/go"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"
}
