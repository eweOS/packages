# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.9.3
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
sha512sums=('5359d07b85b691b92784d5ef52825be2c1f1616bab8e969e51177bf8f5e767edbaf267943296407f62df1f3d7fa08e48c802374289046b71da2cc1ac7d43a15f')

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
