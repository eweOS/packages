# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgit2
pkgver=1.9.7
pkgrel=1
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libgit2.org"
license=('GPL-2.0-only WITH GCC-exception-2.0')
depends=(llhttp musl openssl pcre2 zlib)
makedepends=(cmake libssh2 python)
provides=(libgit2.so)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
)
sha512sums=('96924a4fd87669ad91d40669946cd249b646f3ce85380fc12b553b6c20338ff3c1df5faa6f168b2ca12ed20c8309116a05021f9710ee7ff61e5b8a249172b0ba')

build()
{
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=None \
    -DUSE_HTTP_PARSER=llhttp \
    -DUSE_HTTPS=OpenSSL \
    -DREGEX_BACKEND=pcre2 \
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
