# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=java25-openjdk
pkgname=('jre25-openjdk' 'jdk25-openjdk' 'openjdk25-src' 'openjdk25-doc')
# on a majorver change, don't forget to update the misc files that come along this PKGBUILD
_majorver=25
_minorver=0
_securityver=4
_updatever=4
pkgver=$_majorver.$_minorver.$_securityver.u$_updatever
pkgrel=1
_git_tag=jdk-$_majorver.$_minorver.$_securityver+$_updatever
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://openjdk.java.net/'
license=('LicenseRef-Java')
makedepends=('java-environment>=24' 'java-environment<26' 'zip' 'libelf' 'libcups' 'alsa-lib'
             'graphviz' 'freetype2' 'libjpeg' 'giflib' 'libpng' 'lcms2'
             'bash' 'harfbuzz' 'linux-headers')
optdepends=(
  'gvfs: open links e.g. hyperlinks'
)             
source=(
  https://github.com/openjdk/jdk${_majorver}u/archive/$_git_tag.tar.gz
  use-mold.patch
  no-gen-icon.patch
  install_openjdk.sh
)
sha256sums=('02f5ded3059e3775965ec64a7592102e5ea29e95245cd75411176a4cee9c523c'
            '782d242981e9ae1e9b958ab3730538c4c14187b17cb8385157b0fe3381d2799d'
            'a83ec9e57d49008944fbfb800736f871120893726cc801269d8b93b951650933'
            '474c34747eb84f17be246580fe6c404b6878263647be54541ec16670b4de9b5d')

_jvmdir=/usr/lib/jvm/java-$_majorver-openjdk
_jdkdir=jdk${_majorver}u-${_git_tag//+/-}
_imgdir=$_jdkdir/build/linux-$CARCH-server-release/images

_commondeps=('ca-certificates-utils' 'nss' 'libjpeg'
           'lcms2' 'freetype2' 'harfbuzz' 'java-runtime-common')

prepare() {
  sed -i "s/%THIS_NAME%/java-${_majorver}-openjdk/" install_openjdk.sh

  _patch_ $_jdkdir
}

build() {
  cd $_jdkdir

  NUM_PROC_OPT=''
  MAKEFLAG_J=$(echo $MAKEFLAGS | sed -En 's/.*-j([0-9]+).*/\1/p')
  if [ -n "$MAKEFLAG_J" ]; then
    # http://hg.openjdk.java.net/jdk10/jdk10/file/85e6cb013b98/make/InitSupport.gmk#l105
    echo "Removing '-j$MAKEFLAG_J' from MAKEFLAGS to prevent build fail. Passing it directly to ./configure."
    export MAKEFLAGS=${MAKEFLAGS/-j$MAKEFLAG_J/}
    NUM_PROC_OPT="--with-num-cores=$MAKEFLAG_J"
  fi

  # Avoid optimization of HotSpot to be lowered from O3 to O2
  local _CFLAGS="${CFLAGS//-O2/-O3} $CPPFLAGS -fcommon"
  local _CXXFLAGS="${CXXFLAGS//-O2/-O3} $CPPFLAGS -fcommon"
  local _LDFLAGS=$LDFLAGS

  # TODO: Should be rechecked for the next releases
  # compiling with -fexceptions leads to:
  # /usr/bin/ld: /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/build/linux-x86_64-server-release/hotspot/variant-server/libjvm/objs/zPhysicalMemory.o: in function `ZList<ZMemory>::~ZList()':
  # /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/src/hotspot/share/gc/z/zList.hpp:54: undefined reference to `ZListNode<ZMemory>::~ZListNode()'
  # collect2: error: ld returned 1 exit status
  _CFLAGS=${CFLAGS/-fexceptions/}
  _CXXFLAGS=${CXXFLAGS/-fexceptions/}

  # CFLAGS, CXXFLAGS and LDFLAGS are ignored as shown by a warning
  # in the output of ./configure unless used like such:
  #  --with-extra-cflags="$CFLAGS"
  #  --with-extra-cxxflags="$CXXFLAGS"
  #  --with-extra-ldflags="$LDFLAGS"
  # See also paragraph "Configure Control Variables from "jdk${_majorver}-${_git_tag}/common/doc/building.md
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  if check_option "lto" "y"; then
    jvm_features="zgc,shenandoahgc,link-time-opt"
  else
    jvm_features="zgc,shenandoahgc"
  fi

  [ "$CARCH" == "loongarch64" ] && jvm_features="" # unsupported

  export HEADLESS=1

  bash configure \
    --with-toolchain-type=clang \
    --with-version-build="$_updatever" \
    --with-version-pre="" \
    --with-version-opt="" \
    --with-stdc++lib=dynamic \
    --with-extra-cflags="$_CFLAGS" \
    --with-extra-cxxflags="$_CXXFLAGS" \
    --with-extra-ldflags="$_LDFLAGS" \
    --with-libjpeg=system \
    --with-giflib=system \
    --with-libpng=system \
    --with-lcms=system \
    --with-zlib=system \
    --with-harfbuzz=system \
    --with-jvm-features="$jvm_features" \
    --with-native-debug-symbols=internal \
    --enable-unlimited-crypto \
    --disable-warnings-as-errors \
    --with-vendor-name="eweOS" \
    --enable-headless-only \
    $NUM_PROC_OPT
    #--disable-javac-server

  make images legacy-jre-image docs

  # https://bugs.openjdk.java.net/browse/JDK-8173610
  find "$srcdir/$_imgdir" -iname '*.so' -exec chmod +x {} \;
}

check() {
  cd $_jdkdir
  # TODO package jtreg
  # make -k check
}

_backup_files=(
  etc/$pkgbase/logging.properties
  etc/$pkgbase/management/jmxremote.access
  etc/$pkgbase/management/jmxremote.password.template
  etc/$pkgbase/management/management.properties
  etc/$pkgbase/net.properties
  etc/$pkgbase/security/java.policy
  etc/$pkgbase/security/java.security
  etc/$pkgbase/security/policy/README.txt
  etc/$pkgbase/security/policy/limited/default_US_export.policy
  etc/$pkgbase/security/policy/limited/default_local.policy
  etc/$pkgbase/security/policy/limited/exempt_local.policy
  etc/$pkgbase/security/policy/unlimited/default_US_export.policy
  etc/$pkgbase/security/policy/unlimited/default_local.policy
  etc/$pkgbase/sound.properties
)

_jre_provides=(
  "java-runtime=$_majorver"
  "java-runtime-openjdk=$_majorver"
  "jre$_majorver-openjdk=$pkgver-$pkgrel"
)

_jdk_provides=(
  "${_jre_provides[@]}"
  "java-environment=$_majorver"
  "java-environment-openjdk=$_majorver"
  "jdk$_majorver-openjdk=$pkgver-$pkgrel"
)

_install_common() {
  # Conf
  install -dm 755 "$pkgdir/etc"
  cp -r conf "$pkgdir/etc/$pkgbase"
  ln -s /etc/$pkgbase "$pkgdir/$_jvmdir/conf"

  # Legal
  install -dm 755 "$pkgdir/usr/share/licenses"
  cp -r legal "$pkgdir/usr/share/licenses/$pkgbase"
  ln -s $pkgbase "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/licenses/$pkgbase "$pkgdir/$_jvmdir/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "$f")
    _man=../jdk/man/man1/"$f.1"
    test -f "$_man" && install -Dm 644 "$_man" "$pkgdir/usr/share/man/man1/$f-openjdk$_majorver.1"
  done
  ln -s /usr/share/man "$pkgdir/$_jvmdir/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "$pkgdir$_jvmdir/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "$pkgdir$_jvmdir/lib/security/cacerts"
}

package_jre25-openjdk() {
  pkgdesc="OpenJDK Java $_majorver runtime environment"
  depends=("${_commondeps[@]}")
  provides=("${_jre_provides[@]}")
  conflicts=("jdk25-openjdk")
  backup=("${_backup_files[@]}")
  install=install_openjdk.sh

  cd $_imgdir/jre

  install -dm 755 "$pkgdir$_jvmdir"

  cp -a bin lib \
    "$pkgdir$_jvmdir"

  _install_common
}

package_jdk25-openjdk() {
  pkgdesc="OpenJDK Java $_majorver development kit"
  depends=("${_commondeps[@]}" 'java-environment-common'
           'hicolor-icon-theme' 'libelf' 'giflib' 'libpng'
           'ca-certificates-utils' 'nss' 'libjpeg'
           'lcms2' 'freetype2' 'harfbuzz')
  optdepends=('alsa-lib: for basic sound support'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')

  provides=("${_jdk_provides[@]}")
  conflicts=("jre25-openjdk")
  backup=("${_backup_files[@]}")
  install=install_openjdk.sh

  cd $_imgdir/jdk

  install -dm 755 "$pkgdir$_jvmdir"

  cp -a bin demo include jmods lib release\
    "$pkgdir$_jvmdir"

  rm "$pkgdir$_jvmdir/lib/src.zip"
  
  _install_common
}

package_openjdk25-src() {
  pkgdesc="OpenJDK Java $_majorver sources"
  # Depends on JDK to get license files
  depends=("jdk$_majorver-openjdk=$pkgver-$pkgrel")
  provides=("openjdk$_majorver-src=$pkgver-$pkgrel")

  install -Dm 644 -t "$pkgdir$_jvmdir/lib" $_imgdir/jdk/lib/src.zip

  install -dm 755 "$pkgdir/usr/share/licenses"
  ln -s $pkgbase "$pkgdir/usr/share/licenses/$pkgname"
}

package_openjdk25-doc() {
  pkgdesc="OpenJDK Java $_majorver documentation"
  # Depends on JDK to get license files
  depends=("jdk$_majorver-openjdk=$pkgver-$pkgrel")
  provides=("openjdk$_majorver-doc=$pkgver-$pkgrel")

  install -dm 755 "$pkgdir/usr/share/doc"
  cp -r $_imgdir/docs "$pkgdir/usr/share/doc/$pkgbase"

  install -dm 755 "$pkgdir/usr/share/licenses"
  ln -s $pkgbase "$pkgdir/usr/share/licenses/$pkgname"
}

