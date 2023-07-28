pkgname=btop
pkgver=1.2.13
pkgrel=2
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-llvm15-build.patch")
sha256sums=('668dc4782432564c35ad0d32748f972248cc5c5448c9009faeb3445282920e02'
  '771289ee3254fd414682c10bb15ff2fc082d44d51a91e6238c5fea1a30925a2b')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/fix-llvm15-build.patch
}

build()
{
  # Add D_LARGEFILE64_SOURCE to cflags to avoid incomplete type for musl 1.2.4
  make -C $pkgname-$pkgver CXXFLAGS+="-fexperimental-library -D_LARGEFILE64_SOURCE" OPTFLAGS= all
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
