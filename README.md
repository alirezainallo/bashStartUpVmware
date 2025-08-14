### install vmware tools

```bash
sudo apt install open-vm-tools open-vm-tools-desktop
sudo reboot
```
### clone this repo
```bash
git clone https://github.com/alirezainallo/bashStartUpVmware.git
```
### change bash permision
```bash
sudo chown root:root /home/alireza/Desktop/bashStartUpVmware/startUp.bash
sudo chmod 700 /home/alireza/Desktop/bashStartUpVmware/startUp.bash
```

### create a service

open editor with `sudo nano /etc/systemd/system/myStartUp.service` and paste it:
```service
[Unit]
Description=Run My Script After Network and System Startup
After=network-online.target multi-user.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/home/alireza/Desktop/bashStartUpVmware/startUp.bash
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
just replace `/home/alireza/Desktop/bashStartUpVmware/startUp.bash` with your bash file path.

### start service

```bash
sudo systemctl daemon-reload
sudo systemctl enable myStartUp.service
sudo systemctl start myStartUp.service
```
### pin shared forlder
just `cd /mnt/hgfs` and drag and drop your `shared folder` to your bookmarks.
### check logs
```bash
journalctl -u myStartUp.service -f
```
