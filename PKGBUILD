# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=libgit2
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/libgit2/libgit2"
license=(GPL2)
depends=(musl http-parser openssl pcre zlib)
makedepends=(cmake libssh2 python)
provides=(libgit2.so)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
  $pkgname-1.5.0-remove_http-parse_incompatible_tests.patch
)
sha512sums=('7a32b27cd32bd03ce7be6c127317f82a4ac6f16615c3234699676781f4858d057edb0410b2fe36fd2e634b00748a8b0be17f23809e09a7602ba48185134300f7'
            'f9bb9ad7eb0f43003f5f72c81575ef5751b893fdf257d888b56818ee2c136b496b7cf72627a53dbd01319e33d0dd373e9d6df887360f7bec367419ef0c7ab711')

prepare()
{
  # remove tests that are only compatible with the (modified) vendored version
  # of http-parser, but not with upstream http-parser
  patch -d $pkgname-$pkgver -Np1 -i ../$pkgname-1.5.0-remove_http-parse_incompatible_tests.patch
}

build()
{
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=None \
    -DUSE_HTTP_PARSER=system \
    -DUSE_HTTPS=OpenSSL \
    -DREGEX_BACKEND=pcre \
    -DUSE_SSH=ON \
    -DTHREADSAFE=ON \
    -Wno-dev \
    -B build \
    -S $pkgname-$pkgver
  cmake --build build
}

check()
{
  # NOTE: disable tests requiring the internet and relying on non-existent resources
  ctest --test-dir build \
    --output-on-failure \
    -E "invasive|offline|online|util"
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
