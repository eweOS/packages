# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nss
pkgver=3.98
pkgrel=3
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64 aarch64 riscv64)
license=(GPL MPL)
depends=(
  'nspr>=4.35'
  sqlite
  zlib
  sh
)
makedepends=(
  perl
  python
  gyp
  git
)
source=(
  "nss::git+https://github.com/nss-dev/nss#tag=NSS_${pkgver/./_}_RTM"
  "nss-3.87-use-clang-as.patch"
  'do-not-use-arm-gcm.patch'
)
sha256sums=('SKIP'
            'd78b83d7f80dcbcfceb91716a6cf0e3f388a984a5b295d0a9dc69417bc7f9825'
            '4587713da0a82ac2a994f71c08f6b73a8fbba95e4373f39402f22f813fc4259e')

prepare() {
  _patch_ nss
  cd nss
  sed -i "s@'force_integrated_as%': 0,@'force_integrated_as%': 1,@g" coreconf/config.gypi
}

build() {
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

package() {
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
}
