# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sdl2-mixer
pkgver=2.8.0
pkgrel=1
pkgdesc='An audio mixer that supports various file formats for Simple Directmedia Layer'
url='https://wiki.libsdl.org/SDL2_mixer/FrontPage'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Zlib)
depends=(musl sdl2)
optdepends=('fluidsynth: use fluidsynth for MIDI outout'
	    'libflac: for FLAC support'
	    'mpg123: for MP3 support'
	    'libvorbis: for Vorbis (OGG) support')
makedepends=(cmake libflac mpg123 libvorbis fluidsynth)
provides=(libSDL2_mixer-2.0.so)
source=("https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('1146f00815c8ad22c3d48fbe31ae23dc5997936ebf30b4b3aeab6eab7ea1db3e')
_dirname="SDL_mixer-release-$pkgver"

build() {
	cmake -S "$_dirname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DSDL2MIXER_INSTALL=ON			\
		-DSDL2MIXER_DEPS_SHARED=ON		\
		-DSDL2MIXER_VENDORED=OFF		\
		-DSDL2MIXER_SAMPLES=OFF			\
							\
		-DSDL2MIXER_GME=OFF			\
		-DSDL2MIXER_MOD=OFF			\
		-DSDL2MIXER_OPUS=OFF			\
		-DSDL2MIXER_WAVPACK=OFF			\
							\
		-DSDL2MIXER_FLAC=ON			\
		-DSDL2MIXER_FLAC_LIBFLAC=ON		\
		-DSDL2MIXER_FLAC_LIBFLAC_SHARED=ON	\
		-DSDL2MIXER_FLAC_DRFLAC=OFF		\
							\
		-DSDL2MIXER_MP3=ON			\
		-DSDL2MIXER_MP3_MINIMP3=OFF		\
		-DSDL2MIXER_MP3_MPG123=ON		\
		-DSDL2MIXER_MP3_MPG123_SHARED=ON	\
							\
		-DSDL2MIXER_MIDI=ON			\
		-DSDL2MIXER_MIDI_FLUIDSYNTH=ON		\
		-DSDL2MIXER_MIDI_FLUIDSYNTH_SHARED=ON	\
		-DSDL2MIXER_MIDI_TIMIDITY=OFF		\
							\
		-DSDL2MIXER_VORBIS="VORBISFILE"		\
		-DSDL2MIXER_VORBIS_VORBISFILE_SHARED=ON

	cmake --build build
}

# no testsuite

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_dirname/LICENSE.txt"
}
