# Ouya Controller Steam Configuration

This is a little tutorial for use an Ouya controller in steam.

## Motivation
I have an Ouya and is a cool paperweight. I was bored and i wanted to play [Super Meat Boy](http://store.steampowered.com/app/40800/). I'm a very occacional gamer and i don't want buy an xbox controller for play 30 or 40 minutes. So i tried to use my Ouya controller for play steam in my Arch Linux system. This repository contains the knowledge obtained during my experiment, i did this in an Antergos Distro, but i think that is possible implements in others Linux Distros.

## Tutorial 
### First Steps
1. Download this repository
2. Verify the number of your last event in the `/dev/input/eventXX`, example:

![input event before pair control](http://res.cloudinary.com/juancrg90/image/upload/v1483859734/01_dncqq8.png)

If your last event is equals to `event16` the script `./conf/xboxdrv` is ready to use, In case it is not so please edit the line `evdev = /dev/input/event17` in
 `./conf/xboxdrv` 

 Example, if your last event before pair the controller is `/dev/input/event17` update `evdev = /dev/input/event17` to `evdev = /dev/input/event18`. If the last port is `/dev/input/event15` update `evdev = /dev/input/event17` to `evdev = /dev/input/event16` this event will be the number of the ouya controller when you connect to the system.

### Installing Dependencies
For use the Ouya controller in our system we need connect it via Bluetooth, and for use it in Steam we need emulate a XBox© controller. So, you need install the bluetooth dependencies and the xboxdrv dependency. the `install.sh` script install the dependencies and copy the needed configuration for emulate the Xbox controller with the Ouya Controller.

```bash
sh install.sh
```

### Connect the ouya controller to the system
When the instalation finish. You can use `bluetoothctl` for connect the controller from the terminal.

```bash
$ bluetoothctl
[NEW] Controller XX:XX:XX:XX:XX:XX JuanCrg90-Asus [default]
[NEW] Device XY:XY:XY:XY:XY:XY OUYA Game Controller
[bluetooth]# power on
Changing power on succeeded
[bluetooth]# connect XY:XY:XY:XY:XY:XY
Attempting to connect to XY:XY:XY:XY:XY:XY
[CHG] Device XY:XY:XY:XY:XY:XY Connected: yes
Connection successful
[CHG] Device XY:XY:XY:XY:XY:XY ServicesResolved: yes
[OUYA Game Controller]#
```

![Connecting ouya controller to system](http://res.cloudinary.com/juancrg90/image/upload/v1483859734/03_z41uhr.png)

Now You can move the mouse pointer with the controller touchpad area. In `/etc/input` you can check that now you have a new input

![Ouya controller connected](http://res.cloudinary.com/juancrg90/image/upload/v1483859734/02_cg02dt.png)

### Use xboxdrv for emulate an Xbox Controller
Now you can use the command
``` bash
xboxdrv -c /etc/default/xboxdrv
```
For emulate the controller

![Example xboxdrv](http://res.cloudinary.com/juancrg90/image/upload/v1483862095/Screenshot_from_2017-01-08_01-54-25_gpwqwm.png)

The load takes a moment, The load takes a moment, you will be able to use the controller in steam when you  see the following data:

![Example Controller Ready](http://res.cloudinary.com/juancrg90/image/upload/v1483862408/Screenshot_from_2017-01-08_01-56-55_beai35.png)

Also you can see the controller in the Steam Big picture config.
![Steam config](http://res.cloudinary.com/juancrg90/image/upload/v1483862531/Screenshot_from_2017-01-08_02-01-46_twxu2p.png)

### TODO Record a video using the ouya controller

### Final Notes
The scripts that are in the conf directory i took them from the arch linux forum, the original author is cited in the references. I only organize the information and i try to explain in detail how to connect the controller. i hope you found this tutorial useful.

## References
- [ [SOLVED] Controller not detected by Steam Big Picture](https://bbs.archlinux.org/viewtopic.php?id=183536)
- [Bluethooth Arch Linux wiki](https://wiki.archlinux.org/index.php/Bluetooth)
- [xboxdrv Arch Linux wiki](https://wiki.archlinux.org/index.php/Gamepad#xboxdrv)
- [xboxdrv AUR](https://aur.archlinux.org/packages/xboxdrv/)
