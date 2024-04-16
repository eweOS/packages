# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.8.0
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
)
sha512sums=('e5634267bd9c6a594c9a954d09c657e7b8aadf213609bf7dd83b99863d0d0c7109a5277617dd508abc2da54ea3f12c2af1908d1aeb73c000e94056e2f3653144')

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
