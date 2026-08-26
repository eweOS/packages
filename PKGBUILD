# Maintainer: Yao Zi <ziyao@disroot.org>

# We use OpenResty LuaJIT
pkgname=luajit
_commit=3640b6c590f9c383ffa5d0955f35e646f684a1da
pkgver="2.1.r20260317.${_commit:0:7}"
pkgrel=3
pkgdesc='A Just-In-Time compiler for the Lua programming language.'
url='http://luajit.org/'
# for riscv64: https://github.com/openresty/luajit2/pull/236
# Vanilla LuaJIT: https://github.com/LuaJIT/LuaJIT/pull/1267
arch=(x86_64 aarch64)
license=(MIT)
depends=(musl mimalloc)
makedepends=(git)
provides=(libluajit-5.1.so)
source=("git+https://github.com/OpenResty/luajit2.git#commit=$_commit"
	"module-path.patch"
	"libunwind.patch")
sha256sums=('6d8cabf6fb849d90282acd298e0dcabb72239b6fe66debb4f649b78d007d9498'
            'c0f7c34cb173d78dea4a9a641633a07ed68248498c87ef7e894d8abd4ca7b828'
            'b703d1b358f76287b36413240f53ca4dc4c4390cd8d779e5ae9c30fbf0e84799')

prepare() {
	_patch_ luajit2
}

build () {
	cd luajit2
	make amalg \
		PREFIX=/usr				\
		DEFAULT_CC=clang			\
		BUILDMODE=dynamic			\
		XCFLAGS+="-DLUAJIT_USE_SYSMALLOC"	\
		TARGET_STRIP="true"			\
		TARGET_XLIBS="-lm -lunwind -lmimalloc"
}

package() {
	cd luajit2
	_install_license_ COPYRIGHT
	make install DESTDIR="$pkgdir" \
		PREFIX=/usr					\
		BUILDMODE=dynamic				\
		INSTALL_LMOD="$pkgdir"/usr/share/lua/5.1jit	\
		INSTALL_CMOD="$pkgdir"/usr/lib/lua/5.1jit	\
		TARGET_STRIP="true"
}
