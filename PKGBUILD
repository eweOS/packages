# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nwg-hello
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK3-based greeter for greetd written in python"
url="https://github.com/nwg-piotr/nwg-hello"
arch=('any')
license=('MIT')
depends=('greetd' 'python' 'python-gobject' 'gtk3' 'gtk-layer-shell')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('sway: Wayland compositor nwg-hello has been made for'
            'hyprland: Wayland compositor nwg-hello has been made for')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.tmpfiles")
sha256sums=('d12c2785f6212951e980e76384f26065b7616b0eb2d3af4859079a158f9eb04c'
            '15216838ac4137f3591ae09231fcb450d1dd886af085d5d48452e2299caf917a')

build() {
        cd "${pkgname}-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "${pkgname}-default.json" "${pkgdir}/etc/${pkgname}/${pkgname}-default.json"
	install -Dm 644 "${pkgname}-default.css" "${pkgdir}/etc/${pkgname}/${pkgname}-default.css"
	install -Dm 644 hyprland.conf "${pkgdir}/etc/${pkgname}/hyprland.conf"
	install -Dm 644 sway-config "${pkgdir}/etc/${pkgname}/sway-config"
	install -Dm 644 README "${pkgdir}/etc/${pkgname}/README"
	install -Dm 644 img/* -t "${pkgdir}/usr/share/${pkgname}/"
	install -Dm 644 nwg.jpg "${pkgdir}/usr/share/${pkgname}/nwg.jpg"
	install -Dm 644 cache.json "${pkgdir}/var/cache/${pkgname}/cache.json"
	install -Dm 644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

