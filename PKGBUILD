# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=warzone2100
pkgver=4.6.1
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth"
url="https://wz2100.net/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later')
depends=('sdl2' 'openal' 'libvorbis' 'libtheora' 'libsodium' 'physfs' 'sqlite' 'freetype2' 'libopus' 'fmt' 'zip' 'harfbuzz' 'fribidi' 'protobuf')
makedepends=('libzip' 'mesa' 'vulkan-headers' 'shaderc' 'cmake' 'ninja' 'linux-headers' 'git')
source=(
  ${pkgname}-${pkgver}_src.tar.xz::https://github.com/Warzone2100/warzone2100/releases/download/${pkgver}/${pkgname}_src.tar.xz
  'git+https://github.com/JuliaStrings/utf8proc.git'
  'git+https://github.com/g-truc/glm.git'
  'git+https://github.com/nemtrif/utfcpp.git'
  'git+https://github.com/past-due/launchinfo.git'
  'git+https://github.com/google/re2.git'
  'git+https://github.com/past-due/EmbeddedJSONSignature.git'
  'git+https://github.com/HowardHinnant/date.git'
  'git+https://github.com/Warzone2100/data-texpages.git'
  'git+https://github.com/Warzone2100/data-music-opus.git'
  'git+https://github.com/past-due/discord-rpc.git'
  'git+https://github.com/SRombauts/SQLiteCpp.git'
  'git+https://github.com/cameron314/readerwriterqueue.git'
  'git+https://github.com/fmtlib/fmt.git'
  'git+https://github.com/xiph/opusfile.git'
  'git+https://github.com/Warzone2100/quickjs-wz.git'
  'git+https://github.com/Warzone2100/data-fonts.git'
  'git+https://github.com/Warzone2100/maptools-cli.git'
  'git+https://github.com/BinomialLLC/basis_universal.git'
  'git+https://github.com/Warzone2100/data-terrain-classic.git'
  'git+https://github.com/Warzone2100/data-terrain-high.git'
  'git+https://github.com/Warzone2100/reclamation.git'
  'git+https://github.com/Warzone2100/fractured-kingdom.git'
  'git+https://github.com/paullouisageneau/libplum.git'
  'git+https://github.com/miniupnp/miniupnp.git'
  'git+https://github.com/TartanLlama/expected.git'
  'git+https://github.com/Warzone2100/GameNetworkingSockets.git'
  'git+https://github.com/past-due/innohelperscripts.git'
  'git+https://github.com/Warzone2100/win_installer_resources.git'
  'git+https://github.com/Warzone2100/blender-pie-addon.git'
)
sha256sums=('26ac5538460243f8a149d31264da71caa4d33ef6a8010037eff24e77278ca50b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname

  git submodule init
  git config submodule.3rdparty/utf8proc.url "$srcdir/utf8proc"
  git config submodule.3rdparty/glm.url "$srcdir/glm"
  git config submodule.3rdparty/utfcpp.url "$srcdir/utfcpp"
  git config submodule.3rdparty/launchinfo.url "$srcdir/launchinfo"
  git config submodule.3rdparty/re2.url "$srcdir/re2"
  git config submodule.3rdparty/EmbeddedJSONSignature.url "$srcdir/EmbeddedJSONSignature"
  git config submodule.3rdparty/date.url "$srcdir/date"
  git config submodule.data/base/texpages.url "$srcdir/data-texpages"
  git config submodule.data/music.url "$srcdir/data-music-opus"
  git config submodule.3rdparty/discord-rpc.url "$srcdir/discord-rpc"
  git config submodule.3rdparty/SQLiteCpp.url "$srcdir/SQLiteCpp"
  git config submodule.3rdparty/readerwriterqueue.url "$srcdir/readerwriterqueue"
  git config submodule.3rdparty/fmt.url "$srcdir/fmt"
  git config submodule.lib/sound/3rdparty/opusfile.url "$srcdir/opusfile"
  git config submodule.3rdparty/quickjs-wz.url "$srcdir/quickjs-wz"
  git config submodule.data/fonts.url "$srcdir/data-fonts"
  git config submodule.tools/maptools-cli.url "$srcdir/maptools-cli"
  git config submodule.3rdparty/basis_universal.url "$srcdir/basis_universal"
  git config submodule.3rdparty/data/terrain_overrides/classic.url "$srcdir/data-terrain-classic"
  git config submodule.3rdparty/data/terrain_overrides/high.url "$srcdir/data-terrain-high"
  git config submodule.3rdparty/data/mods/campaign/reclamation.url "$srcdir/reclamation"
  git config submodule.3rdparty/data/mods/campaign/fractured-kingdom.url "$srcdir/fractured-kingdom"
  git config submodule.3rdparty/libplum.url "$srcdir/libplum"
  git config submodule.lib/netplay/3rdparty/miniupnp.url "$srcdir/miniupnp"
  git config submodule.3rdparty/expected.url "$srcdir/expected"
  git config submodule.3rdparty/GameNetworkingSockets.url "$srcdir/GameNetworkingSockets"
  git config submodule.pkg/win_installer/innohelperscripts.url "$srcdir/innohelperscripts"
  git config submodule.pkg/win_installer/resources.url "$srcdir/win_installer_resources"
  git config submodule.tools/blender/pie-addon.url "$srcdir/blender-pie-addon"
  git -c protocol.file.allow=always submodule update
}

build() {
  # 3rdparty/quickjs-wz/quickjs.h:993:34: error: cast-function-type-mismatch
  CXXFLAGS+=" -Wno-cast-function-type-mismatch"
  cmake -B build -S ${pkgname} \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWZ_DISTRIBUTOR="eweOS" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # why is this installed ? Just remove it !
  rm -rfv ${pkgdir}/usr/include
  rm -rfv ${pkgdir}/usr/lib
}
