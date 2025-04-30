# Linux Hang Panik

> [!NOTE]
> Save, memorize this scroll for later!

Linux Hang? Did something idiot? Pause your panik.

- Hold `Alt` + `PrintScreen / SysRq`
- While holding those, Press these in order (assuming `QWERTY`): `R`, `E`, `I`, `S`, `U`, `B`.
    - `R` Switch your keyboard to Raw mode.
    - `E` `SIGTERM` (Signal Terminate) every single tasks except the init (PID 1).
    - `I` (Ayy) `SIGKILL` (Signal Kill) every single tasks except the init (PID 1).
    - `S` Sync all mounted filesystem. Tell all drives to flush it all out, & finish their cache & DRAM managements.
    - `U` Remount every single drives as read-only. So all writing activities stopped entirely.
    - `B` Reboot immediately no question asked. Even without safely removing drives, but since they're now read only, everything should be safe & won't corrupt anything.
- Do this quickly because some Distro quickly disengages and attempt to *unstun* itself if you're late with the sequence, But you already know this session has been screwed & it's Former Human now, why did it awake?.

Now resume your panik. Hmm, at this point it's gone, unless your file indeed gone forever. maybe use `foremost`?

Alternatively, you can replace the `B` with `O` instead to poweroff your system (only works on ATX compliant power supply with the power button is digital (momentary switch instead of toggle) or emulated poweroff standby mode (like old power-button-less RaspberryPi)).

## Troubleshooting

You must enable SysRq immediately after you installed your Distro, because many casual targeted Distros disables it.

## Sauces

- https://en.wikipedia.org/wiki/Magic_SysRq_key
- https://en.wikipedia.org/wiki/System_request
- [Linux Command for Shutdown & Reboot with SysRq](https://youtu.be/BdRIhFcf4Do). DistroTube
- [Magic SysRq key](https://youtu.be/ZiX327d8Ys0). Chris Titus.