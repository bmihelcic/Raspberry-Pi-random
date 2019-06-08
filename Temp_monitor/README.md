This is temperature monitor script for Raspberry Pi.
When you execute the script, it will ask you for how long do you want to map temperatures (in minutes).
After that, you will have complete file, named "temps.csv" with temperature data mapped in 1 min intervals.
You can easily import that in libre office calc and plot awesome diagrams.

Note: do not close terminal session which is running the script, otherwise the test will close.

If you want to run the script from anywhere in the system:<br>
sudo ln -s /home/pi/Raspberry-Pi-random/Temp_monitor/temp_track.sh /usr/bin/temp_monitor
