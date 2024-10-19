# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpaper
pkgver=2.2.5
pkgrel=2
pkgdesc="Library for handling paper characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/rrthomas/libpaper"
# https://github.com/rrthomas/libpaper/pull/37
# libpaper is LGPL-2.1+
# bundled libgnu is LGPL-2.1+, LGPL-2+ and GPL-3+
# paperspecs is Public Domain
# localepaper.c is FSFAP
# paper.c is GPL-3.0-or-later
# paperconf.c is GPL 2.0 only
# localepaper.c is FSFAP (except it is missing the warranty disclaimer... but the intent is clear)
license=(
    LGPL-2.1-or-later
    LicenseRef-Public-Domain
    GPL-3.0-or-later
    LGPL-2.0-or-later
    FSFAP
    MIT
)
backup=('etc/papersize')
source=(https://github.com/rrthomas/libpaper/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        localepaper.c)
sha256sums=('7be50974ce0df0c74e7587f10b04272cd53fd675cb6a1273ae1cc5c9cc9cab09'
            '7e49c6ce67fbaea77929ab5849026412d0f91f692a902805c0134a071cccde22')
provides=('paper')

prepare() {
  cd "$pkgname-$pkgver"
  cp ../localepaper.c src/
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
  # localepaper
  pushd src
  cc $CFLAGS $LDFLAGS -I.. -Ilibgnu -o localepaper localepaper.c libgnu/.libs/libgnupaper.a
  popd
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  
  # localepaper
  install -Dt "$pkgdir/usr/lib" -m0755 src/localepaper 
  

  # add systemwide default papersize read by many office applications
  install -dm 755 "$pkgdir"/etc
  echo '# Simply write the paper name. See man 1 paper and "paper --no-size --all" for possible values' > "$pkgdir"/etc/papersize

  # add libpaper.d directory other packages can use to store files
  install -dm 755 "$pkgdir"/etc/libpaper.d

  # https://github.com/rrthomas/libpaper/commit/b4f6846a3a9ae052a515ac0db913e5a68f947adf
  # reintroduced deprecated paperconf binary
#  # add paperconf executable, needed by libreoffice
#  cat <<EOF > "${pkgdir}"/usr/bin/paperconf
#exec paper --no-size "\$@"
#EOF
#  chmod 755 "${pkgdir}"/usr/bin/paperconf

  # license
  install -Dm644 {COPYING,COPYING-GPL-3,COPYING-MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
