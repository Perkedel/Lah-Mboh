# How to run UZDoom in Gamesir's GameHub?

You can attempt running Windows version of your favourite Doom sourceports on Android, thanks to Gamesir's effort with [GameHub](https://gamehub.xiaoji.com). Relax, the Chinese name of Gamesir I saw is `xiaoji`. also btw, Gamesir is gamepad company in case you lived under the rock. anyway,

![UZDoom on Android with GameHub running Freedoom Phase 1 MAP01](/src/screenshot/UZDoom-gamehub-yay.png)

> [!CAUTION]
> Requires login. For best security, use your public enterprise email address you have if you are the CEO of the enterprise, or use any sacrificial email.  
> You can also use your Gmail (Sign in with Google).

## Steps

- Download [Gamehub from Gamesir](https://gamehub.xiaoji.com). Avoid using Google Play version because that version disabled external file due to abide of certain Google's policy. **Download the APK directly!!!**, & install.
- Run, Login
- Move to the rightmost option to find `Import Games`. Select & choose `PC Game`.
- Navigate to the folder where your source port is.
  - e.g., we'll use [UZDoom](https://zdoom.org/downloads) with [Freedoom Phase 2](https://freedoom.github.io) here.
  - Just extract the source port into a dedicated folder somewhere, and put the `freedoom2.wad` next by the `.exe` file.
  - Go back to GameHub & Import PC Game now. Choose the `uzdoom.exe` at the you have placed.
- Select the `UZDoom`.
- Underneath the Xrossbar & the game title, press 3 Dots menu beside `View Details`.
- `PC Game Settings`
- Update all the components to the latest version!
  - as of today (2025-12-04), I have installed the compatibility as follows:
    - Compatibility Layer = `proton10.0-arm64x-2` because my phone is ARM64
    - GPU Driver = `qcom-842.16`
    - DXVK = `dxvk-2.7.1-1-async`
    - VK3D = `vk3d-proton-3.0a`
    - CPU Translator = `Fex-20251128`
  - And also the components:
    - `cjkfonts`
    - `VulkanRT`
    - `powershell`
    - `base`
    - `vcredist2022`
    - I think, idk, just have what you'd think Windows version of ZDoom needed..
- in `General` Argument must be set explicitly, because GameHub seems to unable to understand ZDoom launcher! Attempting to launch UZDoom raw will consider it crashed. I think I missed something. Because afaik, the launcher part is on ZWidget, maybe it depends on something I have yet figured out.
  - Command Line = e.g., `-iwad freedoom2.wad`
  
Enjoy!

## Bonus

> [!WARNING]
> Always secure your Steam Account with its 2FA, **Steam Guard**!

![Selaco Steam running successfully in GameHub playing 110m Run test Workshop mod](/src/screenshot/Selaco-gamehub.jpg)

You can also login the built-in Steam client feature with your Steam account. It'll fetch all your games you have license for in your Library.  
With this, you can play various Windows games that works with Proton Wine, including Selaco, **complete with Workshop support**, yay!!!  
Always remember to use above latest version components said.

## Compare GameHubing vs. Delta Touch

| GameHub | Spec | Delta Touch |
|---------|------|-------------|
| ![Freedoom Phase 2 MAP01 on UZDoom v4.14.3 on GameHub](/src/screenshot/UZDoom-gamehub-yay.png) | Screenshot | ![Freedoom Phase 2 MAP01 on GZDoom v4.14.2 on Delta Touch](/src/screenshot/freedoom-delta.jpg) |
| UZDoom v4.14.3 | Engine | GZDoom v4.14.2 |
| GameHub v5.3.5 APK Directly | System | DeltaTouch v6.3 |
| Your email address, because requires account **just to work** | Cost | 3 Pts. (US$ 2.99) & your Gmail account you bought it with (required for Google Play DRM for the first time), bla bla bla **just to work** |
| Most High end devices, because you are emulating x86_64 on ARM | Compatible for | Is your phone manufacturer eligible to Google Play Service? We haven't tested it for MicroG rn tho. |
| Setup the files manually, arguments, & update all who-knows depending components | Complexity | ... |

Sorry, [GameNative](https://github.com/utkarshdalal/GameNative) is only a Steam Winlator Android, cannot External EXE right now.  
Sorry, [Freedoom for Android](https://github.com/emileb/Freedoom-for-android) is outdated. use Delta Touch instead.