# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(
  nss
  ca-certificates-mozilla
)
pkgbase=nss
pkgver=3.126
pkgrel=1
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL MPL)
depends=(
  nspr
  p11-kit
  sqlite
  zlib
  sh
)
makedepends=(
  linux-headers
  perl
  python
  gyp
  git
)
source=(
  "nss::git+https://github.com/nss-dev/nss#tag=NSS_${pkgver//./_}_RTM"
  bundle.sh
  certdata2pem.py
)
sha256sums=('43bfcb7514eb7d99fcf62419daddad08ef334657c932f7d02c7028fd9ab4a5bf'
            'f64282fbc8e73de51f88f41e5175d211a63a1a3e1cbf12512a8b9e229ad9d259'
            '142861cf04942c141e7a6d0d39a30b6d4b57f13f27d21bfa90c6abcd5d34de60')

prepare() {
  chmod +x ./{bundle.sh,certdata2pem.py}

  mkdir -p certs
  ln -sf $srcdir/nss/lib/ckfw/builtins/{certdata.txt,nssckbi.h} certs/
}

build() {
  cd certs
  ../certdata2pem.py

  cd ..
  ./bundle.sh

  # remove -march, nss adds +crypto to march for aarch64
  export CFLAGS=`echo $CFLAGS | sed 's/-march=[^ ]*//'`
  export CXXFLAGS=`echo $CXXFLAGS | sed 's/-march=[^ ]*//'`
  local buildsh_options=(
    --disable-tests
    --clang
    --opt
    --system-nspr
    --system-sqlite
  )
  cd $pkgname
  ./build.sh "${buildsh_options[@]}"
}

package_nss() {
  local nsprver="$(pkg-config --modversion nspr)"
  local libdir=/usr/lib includedir=/usr/include/nss

  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,\${prefix},g" \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%includedir%,$includedir,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,$pkgver,g" |
    install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so

  local vmajor vminor vpatch
  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' nss/lib/nss/nss.h)

  sed nss/pkg/pkg-config/nss-config.in \
    -e "s,@prefix@,/usr,g" \
    -e "s,@exec_prefix@,/usr,g" \
    -e "s,@libdir@,$libdir,g" \
    -e "s,@includedir@,$includedir,g" \
    -e "s,@MOD_MAJOR_VERSION@,$vmajor,g" \
    -e "s,@MOD_MINOR_VERSION@,$vminor,g" \
    -e "s,@MOD_PATCH_VERSION@,$vpatch,g" |
    install -D /dev/stdin "$pkgdir/usr/bin/nss-config"

  install -Dt "$pkgdir/usr/bin" \
    dist/Release/bin/{*util,shlibsign,signtool,signver,ssltap}

  install -Dt "$pkgdir$includedir" -m644 dist/public/nss/*.h

  install -Dt "$pkgdir/usr/share/man/man1" -m644 \
    nss/doc/nroff/{*util,signtool,signver,ssltap}.1
    
  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$pkgdir$libdir/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}

package_ca-certificates-mozilla() {
  pkgdesc="Mozilla's set of trusted CA certificates"
  depends=('ca-certificates-utils>=20181109-3')

  install -Dm644 ca-bundle.trust.p11-kit \
    "$pkgdir/usr/share/ca-certificates/trust-source/mozilla.trust.p11-kit"
}
