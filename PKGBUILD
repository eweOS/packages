# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=2048-cpp
_pkgname=2048.cpp
pkgdesc="Fully featured terminal version of the game 2048 written in C++"
pkgver=374
pkgrel=1
license=('MIT')
arch=(x86_64 aarch64 riscv64)
url="https://github.com/plibither8/2048.cpp"
depends=('llvm-libs')
makedepends=('cmake')
git_commit='30597b11aa4b3b68862173b46cf57e0eda20204d'
source=("https://github.com/plibither8/2048.cpp/archive/${git_commit}.zip")
sha512sums=('a08a498ad5b6f0695f02e234537e513e36d46e95c3ff21fc53f130f21333b508ed9416fc48119e6d304784ef6fab7352ee38a6f2c2ac9075ec2295bb610c1c49')

build()
{
  cd $_pkgname-$git_commit
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
  cmake --build .
}

check()
{
  cd $_pkgname-$git_commit
  ctest .
}

package()
{
  cd $_pkgname-$git_commit
  make DESTDIR=$pkgdir install
  rm -r $pkgdir/usr/data
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
