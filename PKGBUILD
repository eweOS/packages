# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.9.6
pkgrel=1
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libgit2.org"
license=('GPL-2.0-only WITH GCC-exception-2.0')
depends=(musl http-parser openssl pcre zlib)
makedepends=(cmake libssh2 python)
provides=(libgit2.so)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
)
sha512sums=('33a4bede42b602d968fd3d2d7e2863e7f64cd23ca147cb2327843afa9a6aa6008c2a8de876ea15813ddcbd247ae8ab23e6528c624554d706ededc0ca20878446')

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
    -E "auth_clone|online|proxy|ssh|"
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  cd $pkgname-$pkgver
  install -vDm 644 AUTHORS README.md -t "$pkgdir/usr/share/doc/$pkgname"
  _install_license_ COPYING
}
