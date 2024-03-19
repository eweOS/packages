_lua_pkgname_() {
	for v in ${luaversion[@]}; do
		printf "lua$v-$luapkgbase "
	done
}

_lua_pkgbase_() {
	printf "lua-$luapkgbase"
}

_lua_dotted_ver_() {
	echo ${1:0:1}.${1:1:1}
}

_lua_set_var_() {
	_lver_=$1
	_ldotver_=$(_lua_dotted_ver_ $1)
	_lua_inc_path_=/usr/include/lua$_ldotver_
	_lua_lib_name_=lua-$_ldotver_
	_lua_path_=/usr/share/lua/$_ldotver_
	_lua_cpath_=/usr/lib/lua/$_ldotver_
	_lua_license_dir_=/usr/share/lua
}

_lua_build_() {
	for v in ${luaversion[*]}; do
		cd $srcdir
		_lua_set_var_ $v
		_lua_do_build_
	done
}

_lua_check_() {
	for v in ${luaversion[*]}; do
		cd $srcdir
		_lua_set_var_ $v
		_lua_do_check_
	done
}

_lua_package_() {
	_lua_set_var_ ${pkgname:3:2}
	depends=$_depends
	depends+=(lua$_lver_)
	_lua_do_package_
}

_lua_install_cmodule_ () {
	install -Dm755 $1 $pkgdir/$_lua_cpath_/$(basename $1)
}
