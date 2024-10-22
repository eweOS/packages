# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.8.2
pkgrel=1
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/libgit2/libgit2"
license=(GPL-2.0-only-with-linking-exception)
depends=(musl http-parser openssl pcre zlib)
makedepends=(cmake libssh2 python)
provides=(libgit2.so)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
)
sha512sums=('568daa01b254acd07624143c1fd949b131f174a0595e4c6031b1eee38afd59ec3917ffc5ade3310d2a17f22bf5062bc6d03603cb952b25cdefd6c1cec9b8033c')

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
