# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catnest
pkgver=0.3.0
pkgrel=1
pkgdesc="A substitution of systemd-sysusers"
url="https://github.com/eweOS/catnest"
license=(MIT)
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=(git)
options=(emptydirs)
source=(
  "git+https://github.com/eweOS/catnest#tag=v$pkgver"
  "$pkgname.service"
  "basic.conf"
  "catnest-reload.hook"
)
sha256sums=('2857f29520aeb92c29a8d6f8cbcdeaf6c8d869261d3821745694e0e16dd4c66e'
            '37ac92afc1b5b79f72fffdd57c1771b8bc060f659b1e71c266da1d08982f65eb'
            '719dd6b9794afc10206967feae0f1f6723df9a7c4c7e3f6321c874833a9058ad'
            'df7685e245d9afee96e237f4a233e3bf1a3b8431da0268fab29fb9ccb04913ce')

prepare()
{
  # Use Clang!
  sed -i 's/gcc/cc/g; s/-Werror/-Werror -Wno-missing-field-initializers/g' $pkgname/release.sh
}

build()
{
  cd $pkgname
  ./release.sh
}

package()
{
  cd $pkgname
  mkdir -p $pkgdir/etc/sysusers.d
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -D ../basic.conf $pkgdir/usr/lib/sysusers.d/basic.conf
  install -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  _install_license_ LICENSE
  _dinit_install_services_ $srcdir/$pkgname.service
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 $srcdir/catnest-reload.hook
}
