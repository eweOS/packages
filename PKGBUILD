# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libevent
pkgver=2.1.13
pkgrel=1
pkgdesc="Event notification library"
url="https://libevent.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(openssl)
makedepends=(cmake ninja python zlib)
optdepends=('python: event_rpcgen.py')
provides=(libevent{,_core,_extra,_openssl,_pthreads}-2.1.so)
source=("https://github.com/libevent/libevent/releases/download/release-$pkgver-stable/libevent-$pkgver-stable.tar.gz")
sha256sums=('f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c')

build()
{
  cmake -S libevent-$pkgver-stable -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=TRUE \
    -DEVENT__LIBRARY_TYPE=SHARED \
    -DEVENT__DISABLE_REGRESS=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

check()
{
  cd build
  ctest \
    --output-on-failure \
    --stop-on-failure \
    -j$(nproc)
}

package_libevent()
{
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libevent-$pkgver-stable/LICENSE
}
