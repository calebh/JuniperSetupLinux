echo "Please enter the version in the following format: <major version>.<minor version>-<package revision>"
read version_info
build_dir="juniper_$version_info"
mkdir $build_dir
mkdir "$build_dir/usr"
mkdir "$build_dir/usr/bin"
mkdir "$build_dir/usr/share"
mkdir "$build_dir/usr/share/juniper"
cp -a "../Juniper/Juniper/bin/Release/." "$build_dir/usr/share/juniper/"
cp -a "../Juniper/Juniper/bin/Release/juniper" "$build_dir/usr/bin/"
mkdir "$build_dir/DEBIAN"
echo "Package: juniper" >> "$build_dir/DEBIAN/control"
echo "Version: $version_info" >> "$build_dir/DEBIAN/control"
echo "Section: base" >> "$build_dir/DEBIAN/control"
echo "Priority: optional" >> "$build_dir/DEBIAN/control"
echo "Architecture: all" >> "$build_dir/DEBIAN/control"
echo "Depends: mono-runtime" >> "$build_dir/DEBIAN/control"
echo "Maintainer: Caleb Helbling <caleb.helbling@yahoo.com>" >> "$build_dir/DEBIAN/control"
echo "Description: Juniper" >> "$build_dir/DEBIAN/control"
echo " The compiler for the Juniper programming language" >> "$build_dir/DEBIAN/control"
fakeroot dpkg-deb --build $build_dir
