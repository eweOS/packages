# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=vulkan-tools
pkgver=1.3.290
pkgrel=1
pkgdesc='Vulkan Development Tools'
url='https://github.com/KhronosGroup/Vulkan-Tools/'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(wayland libvulkan.so)
makedepends=(cmake python vulkan-headers vulkan-icd-loader wayland-protocols
	     glslang spirv-tools vulkan-volk linux-headers)
source=("https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e07c900f770a8bb596ee5c5ba427eab473ec3bc6b70df2554ebce8a51d1b282a')

build () {
	local project_options=(
		-DBUILD_CUBE=ON
		-DBUILD_VULKANINFO=ON
		-DBUILD_ICD=ON
		-DBUILD_TESTS=OFF
		-DTOOLS_CODEGEN=OFF
	)
	local vkcube_options=(
		-DCUBE_WSI_SELECTION="WAYLAND"
		-DBUILD_WSI_XCB_SUPPORT=OFF
		-DBUILD_WSI_XLIB_SUPPORT=OFF
		-DBUILD_WSI_WAYLAND_SUPPORT=ON
		-DBUILD_WSI_DIRECTFB_SUPPORT=OFF
	)

	cmake -S "Vulkan-Tools-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		${project_options[*]}			\
		${vkcube_options[*]}

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	rm "$pkgdir/usr/bin/vkcube-wayland"
	ln -s vkcube "$pkgdir/usr/bin/vkcube-wayland"
}
