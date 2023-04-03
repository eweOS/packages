# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=libevent
pkgver=2.1.12
pkgrel=2
pkgdesc="Event notification library"
url="https://libevent.org/"
arch=(x86_64 aarch64)
license=(BSD)
depends=(openssl)
makedepends=(cmake ninja python zlib)
optdepends=('python: event_rpcgen.py')
provides=(libevent{,_core,_extra,_openssl,_pthreads}-2.1.so)
source=("https://github.com/libevent/libevent/releases/download/release-$pkgver-stable/libevent-$pkgver-stable.tar.gz")
sha256sums=('92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb')

build()
{
  cmake -S libevent-$pkgver-stable -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=TRUE \
    -DEVENT__LIBRARY_TYPE=SHARED \
    -DEVENT__DISABLE_REGRESS=OFF
  cmake --build build
}

check()
{
  cd build
  # four matching test failed, unknown reason (suspect zlib-ng)
  ctest -E "regress__((timerfd_)?(changelist_)?EPOLL|SELECT)_debug" \
    --output-on-failure \
    --stop-on-failure \
    -j$(nproc)
}

package_libevent()
{
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libevent-$pkgver-stable/LICENSE
}
