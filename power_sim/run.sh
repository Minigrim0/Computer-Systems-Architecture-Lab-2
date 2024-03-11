echo "Running LUD"
./lud.gpu -s 512 -v > stats/lud_sta3300Mhz.txt
echo "Done, saving file"
mv gpgpusim_power_report* 'pow/power_report-lud-300MHz.log'

echo "Running HotSpot3D"
./hotspot3d.gpu 512 8 4 ../is2202_labs_apps-1/data/power_512x8 ../is2202_labs_apps-1/data/temp_512x8 output.out > stats/hotspot3d_stat-300MHz.txt
echo "Done, moving file"
mv gpgpusim_power_report* 'pow/power_report-hotspot3d-300MHz.log'

echo "Running bfs"
./bfs.gpu ../is2202_labs_apps-1/data/graph65536.txt > stats/bfs_stat-300MHz.txt
echo "Done, moving file"
mv gpgpusim_power_report* 'pow/power_report-bfs-300MHz.log'
