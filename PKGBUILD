# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cataclysm-dda
pkgver=0.H
_pkgver=0.H
pkgrel=1
pkgdesc="A post-apocalyptic roguelike. (TUI version)"
url="https://cataclysmdda.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("CCPL:by-sa")
depends=('llvm-libs' 'ncurses' 'gettext')
makedepends=('astyle')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/CleverRaven/Cataclysm-DDA/archive/$_pkgver.tar.gz"
  makefile-fix-busybox-missing-args.patch clang-19.patch)
md5sums=('6db0a1a9166c38095b657efc589b54e3'
         '8ea84849d7831bcbfa50bf0380e5e9ae'
	 '8260f97f4d2516b4e4185dec48c47fdc')

_makeflags=('CXX=c++'
  'PREFIX=/usr'
  'RELEASE=1'
  'USE_XDG_DIR=1'
  'BACKTRACE=0'
  'RUNTESTS=0'
  'ZLEVELS=1'
  'LTO=0' # clang throws error unknown argument: '-flto-odr-type-merging'
  'LOCALIZE=1'
  'LANGUAGES=all')

prepare()
{
  _patch_ "Cataclysm-DDA-$_pkgver"
  cd "Cataclysm-DDA-$_pkgver"
  sed -i 's/-Werror//' Makefile
  sed -i 's/ncursesw5-config/ncursesw6-config/' Makefile
  sed -i 's/shell git/shell false/' Makefile
}

build()
{
  cd "Cataclysm-DDA-$_pkgver"
  make ${_makeflags[@]}
  ./lang/compile_mo.sh
}

package()
{
  cd "Cataclysm-DDA-$_pkgver"

  make ${_makeflags[@]} DESTDIR=$pkgdir install

  # Docs
  install -d "$pkgdir/usr/share/doc/cataclysm-dda"
  cp -r doc/* "$pkgdir/usr/share/doc/cataclysm-dda"
  # undo symlink
  rm "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"
  cp 'data/json/LOADING_ORDER.md' "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"

  # License
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Languages
  cd lang/mo
  for i in *; do
    install -d "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
    cp "${i}/LC_MESSAGES/cataclysm-dda.mo" "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
  done

  # Help
  cd ./../..
  install -Dm644 ./data/help/* "${pkgdir}/usr/share/${pkgname}/help"
}
