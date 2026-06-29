# Maintainer: Julian Droske <juliandroske@outlook.com>

pkgname=7zip
pkgver=26.02
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://7-zip.org"
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'custom:unRAR')
provides=(p7zip)
conflicts=(p7zip)
replaces=(p7zip)
depends=(
  musl
  llvm-libs
)
# 0001-adjust-7z.so-load-path-for-eweos.patch
# 	The executable `7z` searches for its requistie `7z.so` from the same
# 	directory (intended to store plugins) as where it lies at runtime.
# 	This causes problems when `7z` is installed under `/usr/bin/` as a
# 	command while `7z.so` is put in `/usr/lib/7zip/` as FHS implies.
# 	This patch modifies the search path so that 7z always search for plugins
# 	(including 7z.so) under `/usr/lib/7zip` without any shell script wrappers.
source=(
  'https://www.7-zip.org/a/7z2501-src.tar.xz'
  '0001-adjust-7z.so-load-path-for-eweos.patch'
)
sha256sums=('ed087f83ee789c1ea5f39c464c55a5c9d4008deb0efe900814f2df262b82c36e'
            '9d3604f51ddcdee78631c31d90e93949cb41772a91f6d9b98b8fac5dc90a028a')

prepare(){
  _patch_ .
}

build(){
  cd "${srcdir}"
  export O=build

  # 7z - main program that uses plugins
  make -C CPP/7zip/UI/Console -f makefile.gcc
  # 7z.so - necessary library required by 7z
  make -C CPP/7zip/Bundles/Format7zF -f makefile.gcc
  # 7za - more lightweight
  make -C CPP/7zip/Bundles/Alone -f makefile.gcc
  # 7zr - only handle .7z archives
  make -C CPP/7zip/Bundles/Alone7z -f makefile.gcc
}

package(){
  cd "${srcdir}"

  # target directories
  install -dm0755 \
  	"${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/7zip" \
    "${pkgdir}/usr/share/doc/7zip" \
    "${pkgdir}/usr/share/licenses/7zip"

  # 7z, 7za, 7zr
  install -Dm0755 \
    CPP/7zip/UI/Console/build/7z \
    CPP/7zip/Bundles/Alone/build/7za \
    CPP/7zip/Bundles/Alone7z/build/7zr \
    "${pkgdir}/usr/bin"

  # 7z.so
  install -Dm0755 \
    CPP/7zip/Bundles/Format7zF/build/7z.so \
    "${pkgdir}/usr/lib/7zip"

  # Docs & licenses
  cp -a DOC "${pkgdir}/usr/share/doc/7zip/"
  ln -s /usr/share/doc/7zip/DOC/{License,unRarLicense}.txt \
    "${pkgdir}/usr/share/licenses/7zip/"
}
