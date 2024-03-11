echo "cleaning"
rm gpgpusim_power_report*

echo "Running LUD"
./lud.gpu -s 512 -v > lud_stat.txt
echo "Done, saving file"
mv gpgpusim_power_report* power_report-lud.log

echo "Running HotSpot3D"
./hotspot3d.gpu 512 8 4 ../../is2202_labs_apps-1/data/power_512x8 ../../is2202_labs_apps-1/data/temp_512x8 output.out > hotspot3d_stat.txt
echo "Done, moving file"
mv gpgpusim_power_report* power_report-hotspot3d.log

echo "Running bfs"
./bfs.gpu ../../is2202_labs_apps-1/data/graph65536.txt > bfs_stat.txt
echo "Done, moving file"
mv gpgpusim_power_report* power_report-bfs.log