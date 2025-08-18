# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ghc
pkgver=9.6.7
pkgrel=2
pkgdesc='Glasgow Haskell Compiler.'
url='https://ghc.haskell.org/'
arch=(x86_64 aarch64 riscv64)		# NOTICE: we use NCG only
_commit=e55b89cda358239fb7f6e713ea19027121cdf74c # 2025-08-17
license=(BSD-3-Clause)
depends=(musl libffi libnuma gmp ncurses lld)
# missing python-sphinx
makedepends=(python ghc cabal alex happy git)
options=(!strip)
# 0001: Should be upstreamed, detects musl targets correctly or GHC may pass
#	glibc triplets to Clang, causing glibc libraries are linked.
source=("git+https://github.com/eweOS/ghc.git#commit=$_commit"
	"0001-fix-llvm-target-musl.patch")
sha256sums=('5712c2b39259c0d4f6138fc9abcc43c202a6599083b79711a253a59f5efd5718'
            'dd5f98dee96308fd8af621a3c782dea7541f196da0deded6b3866cc339bb9e38')

# Generated with
#	git submodule status | awk -e '{ print("\""$2"="$1"\"") }'
_submodule_snapshot=(
	"libffi-tarballs 89a9b01c5647c8f0d3899435b99df690f582e9f1"
	"libraries/Cabal 256f85d735310196d437ede86046f2a86efedc6d"
	"libraries/Win32 931497f7052f63cb5cfd4494a94e572c5c570642"
	"libraries/array c9cb2c1e8762aa83b6e77af82c87a55e03e990e4"
	"libraries/binary 96599519783a5e02e9f050744a7ce5fb0940dc99"
	"libraries/bytestring 59fc758efe0e1dd98ed4168f38020cefee772963"
	"libraries/containers 9f4a93604c66a5e605ce46fc30003b71802b3cfd"
	"libraries/deepseq 0bfe57809f8ecaf1921b82a6791d1ecc317d1998"
	"libraries/directory e8ee4d5565ec82272ca612034ba6029993e23fd0"
	"libraries/exceptions a473e4fa1acdbcfc7cc96f84ae3f2cb38261e08b"
	"libraries/filepath d67762a66eba4ee9b47e1cdfdf277bbd31925e7a"
	"libraries/ghc-bignum/gmp/gmp-tarballs 01149ce3471128e9fe0feca607579981f4b64395"
	"libraries/haskeline 1c2ad91edc936a9836d1ad80a26f8be03a7d8bb0"
	"libraries/hpc 767f476a5aa19260c8297ce40134f56d6f890019"
	"libraries/mtl 37cbd924cb71eba591a2e2b6b131767f632d22c9"
	"libraries/parsec 1f542120d9adc5e22f8791a6d595210e93c6c389"
	"libraries/pretty c3a1469306b35fa5d023dc570554f97f1a90435d"
	"libraries/process eee87f2838356431930e1fe8f8527db609e3252b"
	"libraries/stm cfb7e775c5f6df281b7052b7b4e4a51dafda10d2"
	"libraries/terminfo 98100776edcf33796ddf2e752233e6ef179b876d"
	"libraries/text e815d4d9bc362f4a3a36a850931fd3504eda967e"
	"libraries/time baab563ee2ce547f7b7f7e7069ed09db2d406941"
	"libraries/transformers ef4fa181ebea77ac6997d392d1ef5a09524f06b2"
	"libraries/unix 6be36ed54cc035c0f095d24bf3a451638d45513c"
	"libraries/xhtml 721779acc35dccd6a43a292b24099b65d93d390c"
	"nofib 2cee92861c43ac74154bbd155a83f9f4ad0b9f2f"
	"utils/haddock bbf452065167e6a5b3398cd1868d6788f8f21c13"
	"utils/hsc2hs 1ba092932f86c1fda15091d355ba7975b8554437")

prepare() {
	cabal update

	_patch_ ghc

	cd ghc
	git submodule init
	git submodule update

	for _snapshot in "${_submodule_snapshot[@]}"; do
		_path="${_snapshot%% *}"
		_hash="${_snapshot##* }"

		pushd "$_path"
		git checkout "$_hash"
		popd
	done

	./boot
	autoreconf -iv
}

build () {
	cd ghc
	# Pretend it's a release build to prevent GHC from adding date suffix
	# to versions of prelude libraries
	RELEASE=yes ./configure --with-system-libffi

	./hadrian/build-cabal -j$JOBS \
		--docs=none		\
		--flavour=release	\
		binary-dist-dir
}


# skip checks for now
# check() {
# 	cd ghc
# }

package() {
	cd ghc/_build/bindist/ghc-*/

	./configure --prefix=/usr
	make install DESTDIR=$pkgdir

	# TODO: strip the compiler
}
