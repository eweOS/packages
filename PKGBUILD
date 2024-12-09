# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.8.4
pkgrel=2
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/libgit2/libgit2"
license=(GPL-2.0-only-with-linking-exception)
depends=(musl http-parser openssl pcre zlib)
makedepends=(cmake libssh2 python)
provides=(libgit2.so)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
)
sha512sums=('f1409d97c8cf072ea24f3d923fdc9468d21f171f72005c13c5358f520fdccb5f3950d1c7c16cea48a8a08df6a57280da46fe60c9b6aa8a8aae2ab1363c41d246')

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
