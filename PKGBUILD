# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=musl
pkgname=(musl musl-static)
pkgver=1.2.6
pkgrel=1
pkgdesc='An implementation of the C/POSIX standard library.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://musl.libc.org'
license=(MIT)
makedepends=(lld)
provides=(ld-musl-$(arch).so.1 libc.so)
# disable lto: https://github.com/InBetweenNames/gentooLTO/issues/244
options=(!lto)
# 0001: Backport 6f6bd4a1896b ("dns: fix nameserver OOB read in IPv6-disabled fallback")
# 0002: Backport 0572555dab1d ("fix incorrect access to tzname[] by strptime %Z conversion specifier")
# 0003: Backport 40acb04b2c12 ("regex: reject invalid \digit back reference in BRE")
# 0004: Backport 67219f0130ec ("fix pathological slowness & incorrect mappings in iconv gb18030 decoder")
#	This is a security fix since the slow decoder might be exploited for DoS
#	attack.
# TODO: get{conf,ent}.c and iconv.c should be split into another package
source=(
  "http://www.etalabs.net/musl/releases/$pkgbase-$pkgver.tar.gz"
  "getconf.c" "getent.c" "iconv.c"
  "0001-dns-fix-nameserver-OOB-read-in-IPv6-disabled-fallbac.patch"
  "0002-fix-incorrect-access-to-tzname-by-strptime-Z-convers.patch"
  "0003-regex-reject-invalid-digit-back-reference-in-BRE.patch"
  "0004-fix-pathological-slowness-incorrect-mappings-in-icon.patch"
)
sha256sums=('d585fd3b613c66151fc3249e8ed44f77020cb5e6c1e635a616d3f9f82460512a'
            'd87d0cbb3690ae2c5d8cc218349fd8278b93855dd625deaf7ae50e320aad247c'
            '002c1a216f6bed0f816ab1cfebde94a0b127193ef410c36b2190599983e015b8'
            'f79a2930a2e5bb0624321589edf8b889d1e9b603e01e6b7ae214616605b3fdd7'
            '07f609c0d70cde7b22a983f816185ee80c08015ec9e24c554b7960b9498638c7'
            'e0aec6b990e67eccdad65d421b67ba9a7840d4f6c7b20a7c9e46735d2a94c1e8'
            '37f6426eab187748f397fcb52443dba209d9744d6f9161222ad2645d8637967f'
            '0ce3d109f3bb3f1bc1252717de126ee5f259a002c47fdccd42cb36c138e88e84')

prepare()
{
  _patch_ $pkgbase-$pkgver
  cd $pkgbase-$pkgver
  # utmp/wtmp path
  sed -i 's/\/dev\/null\/utmp/\/run\/utmps\/utmp/g' include/paths.h
  sed -i 's/\/dev\/null\/wtmp/\/var\/log\/wtmp/g' include/paths.h
}

build()
{
  cd $pkgbase-$pkgver
  # Linking with mold would cause segfault with mimalloc
  CFLAGS="$CFLAGS -fuse-ld=lld"
  ./configure --prefix=/usr --syslibdir=/usr/lib
  make
  cd $srcdir
  local i
  for i in getconf getent iconv; do
    cc $CFLAGS $i.c -o $i
  done
}

package_musl()
{
  cd $pkgbase-$pkgver
  make DESTDIR=${pkgdir} install
  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/libc.so "${pkgdir}"/usr/bin/ldd
  install -D \
    $srcdir/getent \
    $srcdir/getconf \
    $srcdir/iconv \
    $pkgdir/usr/bin
  # provide by utmps
  rm "${pkgdir}"/usr/include/utmp{,x}.h

  # provide by libxcrypt
  rm "${pkgdir}"/usr/include/crypt.h

  mkdir -p $srcdir/static
  # only libc.a is real musl-static
  mv $pkgdir/usr/lib/libc.a $srcdir/static
}

package_musl-static()
{
  options=('staticlibs')
  mkdir -p $pkgdir/usr/lib
  mv $srcdir/static/libc.a $pkgdir/usr/lib
}
