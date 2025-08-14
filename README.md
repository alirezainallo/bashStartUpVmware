### install vmware tools

```bash
sudo apt install open-vm-tools open-vm-tools-desktop
sudo reboot
```

### create a service

open editor with `sudo nano /etc/systemd/system/myStartUp.service` and paste it:

[Unit]
Description=Run My Script After Network and System Startup
After=network-online.target multi-user.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/home/alireza/Desktop/bashStartUpVmware/startUp.bash
Restart=on-failure

[Install]
WantedBy=multi-user.target

just replace `/home/alireza/Desktop/bashStartUpVmware/startUp.bash` with your bash file path.

### start service

```bash
sudo systemctl daemon-reload
sudo systemctl enable myStartUp.service
sudo systemctl start myStartUp.service
```

### check logs

journalctl -u myStartUp.service -f
