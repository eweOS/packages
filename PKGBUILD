# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=temu
pkgdesc='Tiny Emulator'
pkgver='2019_12_21'
version='2019-12-21'
pkgrel=3
url='https://bellard.org/tinyemu'
license=('MIT')
depends=('musl' 'openssl' 'curl')
makedepends=('linux-headers')
# 0001: Should be upstreamed, fix
#	/usr/include/curl/multi.h:428:23: error: expected identifier or '('
#	  428 | CURL_EXTERN CURLMcode curl_multi_setopt(CURLM *multi_handle,
#	caused by problematic including orders.
#
#	cURL supports type-checking with typecheck-gcc.h, which re-aliases cURL
#	APIs as macros to perform additional type checks. In case curl.h is
#	included directly, multi.h is included before typecheck-gcc.h, and
#	everything is okay.
#
#	But when multi.h is included in the application without including
#	curl.h first, multi.h will recursively includes curl.h, and the
#	macro-version alias of cURL APIs, for example, curl_multi_setopt(),
#	would also be instantiated in definition of function-version alias,
#	causing strange syntax errors.
#
#	This isn't a curl error. Quoting the comment in multi.h,
#
# This header file should not really need to include "curl.h" since curl.h
# itself includes this file and we expect user applications to do #include
# <curl/curl.h> without the need for especially including multi.h.
#
# For some reason we added this include here at one point, and rather than to
# break existing (wrongly written) libcurl applications, we leave it as-is
# but with this warning attached.
source=("https://bellard.org/tinyemu/tinyemu-${version}.tar.gz"
	0001-Avoid-including-curl-multi-h-directly.patch)
sha256sums=('be8351f2121819b3172fcedce5cb1826fa12c87da1b7ed98f269d3e802a05555'
            'f781eec9a95fc0265eeb2e348cf064f948fe15a9af92d9f18818aa53a6502d43')
arch=(x86_64 aarch64 riscv64 loongarch64)

prepare() {
	_patch_ tinyemu-${version}
}

build() {
	cd tinyemu-${version}
	make CONFIG_SDL=
}

package() {
	cd tinyemu-${version}
	mkdir -p "${pkgdir}"/usr/bin
	make CONFIG_SDL= install bindir="${pkgdir}"/usr/bin
	install -Dm 644 MIT-LICENSE.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
