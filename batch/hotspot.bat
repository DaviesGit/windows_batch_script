@echo off
netsh wlan set hostednetwork mode=allow ssid=Davies_hotspot key=12345678
netsh wlan start hostednetwork