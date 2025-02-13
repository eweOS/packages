# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=musl
pkgname=(musl musl-static)
pkgver=1.2.5
pkgrel=5
pkgdesc='An implementation of the C/POSIX standard library.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://musl.libc.org'
license=(MIT)
groups=(base-devel)
makedepends=(lld)
provides=(ld-musl-$(arch).so.1 libc.so)
# disable lto: https://github.com/InBetweenNames/gentooLTO/issues/244
options=(!lto)
# 0001: Downstream, see https://github.com/sabotage-linux/gettext-tiny/pull/71
# TODO: It should be upstreamed! musl contains another problematic stub.
# 0002, 0003: Backport, CVE-2025-26519
# https://www.openwall.com/lists/oss-security/2025/02/13/2
# 0004: Backport, support TLSDESC on loongarch74
# TODO: get{conf,ent}.c and iconv.c should be split into another package
source=(
  "http://www.etalabs.net/musl/releases/$pkgbase-$pkgver.tar.gz"
  "getconf.c" "getent.c" "iconv.c"
  "0001-bind_textdomain_codeset.patch"
  "0002-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch"
  "0003-iconv-harden-UTF-8-output-code-path-against-input-de.patch"
  "0004-loongarch64-relocation-14.patch::https://git.musl-libc.org/cgit/musl/patch/?id=61399d4bd02ae1ec03068445aa7ffe9174466bfd"
)
sha256sums=('a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4'
            'd87d0cbb3690ae2c5d8cc218349fd8278b93855dd625deaf7ae50e320aad247c'
            '002c1a216f6bed0f816ab1cfebde94a0b127193ef410c36b2190599983e015b8'
            'f79a2930a2e5bb0624321589edf8b889d1e9b603e01e6b7ae214616605b3fdd7'
            'df1f5ad28eaa8628de8ba0f0cc2918918e7ae7d5c976ba3a9e0370251ce7ab47'
            'b47fb7b09d6cdc6747713121b1c349151f44bd06d8a0217ace599d211b648d26'
            '6727e36567b4a240adf287cc9247b1df90f8a80560ded3d546182ba6f62327ff'
            'c1228faaa0762f247c11dc533fcc39023523d598ffd567cdb0a3d62f5ac7d0b8')

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
  mv $pkgdir/usr/lib/*.a $srcdir/static
}

package_musl-static()
{
  options=('staticlibs')
  mkdir -p $pkgdir/usr/lib
  mv $srcdir/static/*.a $pkgdir/usr/lib
}
