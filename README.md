# Pico Windows Auto-Installer

> Provision a fresh Windows PC from a Raspberry Pi Pico acting as a USB HID keyboard — no clicking, no Next-Next-Finish.

[![Platform](https://img.shields.io/badge/target-Windows-0078D4?logo=windows&logoColor=white)](#requirements)
[![Hardware](https://img.shields.io/badge/hardware-Raspberry%20Pi%20Pico-C51A4A?logo=raspberrypi&logoColor=white)](#requirements)
[![Payload](https://img.shields.io/badge/payload-DuckyScript-6E4C13)](#how-it-works)

This repository contains a DuckyScript payload and a self-elevating batch installer that automate the software setup of a Windows machine. The Pico plugs in as a keyboard, types the commands, and the target installs a fixed set of drivers, applications and utilities from an attached `X:` volume.

---

## Table of contents

- [How it works](#how-it-works)
- [Repository contents](#repository-contents)
- [Requirements](#requirements)
- [Preparing the drive](#preparing-the-drive)
- [Usage](#usage)
- [Customisation](#customisation)
- [Legal notice](#legal-notice)
- [Author](#author)

---

## How it works

| Component | Role |
| --- | --- |
| `payload.dd` | DuckyScript payload flashed to the Pico. Opens **Run**, launches each installer from `X:\`, and advances through the prompts. |
| `Install_3.7.bat` | Manual alternative. Self-elevates via UAC, offers a choice of Office version, then runs each installer with `/S` (silent) where supported. |
| `X:` drive | USB storage holding the installers at the paths referenced by the payload and script. |

The Pico is not a storage device in this setup — it only emulates a keyboard. Windows sees a normal keyboard and receives pre-recorded keystrokes.

## Repository contents

```
.
├── payload.dd      # DuckyScript payload for the Pico
├── Install_3.7.bat # Self-elevating batch installer
└── README.md
```

## Requirements

| Item | Detail |
| --- | --- |
| Board | Raspberry Pi Pico or any RP2040 board running DuckyScript-compatible firmware |
| Target | Windows 10 / 11, local administrator account |
| Drive | A USB drive mounted as `X:` containing the installers |
| Tools | A DuckyScript flasher/encoder compatible with your Pico firmware |

> Drive letter `X:` is hard-coded. Remap your USB drive to `X:` or edit the paths before running.

## Preparing the drive

The payload and the batch file expect the following structure (paths used by `payload.dd`):

```
X:\
├── SDI_RUS\
│   └── SDI_x64_R2305.exe
└── Apps\
    ├── office\
    │   └── Office14.X86.en-US\
    │       └── setup.exe
    ├── Activator\
    │   └── Activator.exe
    ├── Google.Chrome.118.0.5993.89.Final.x64_YasDL.com.msi
    └── VLC.Media.Player.3.0.16.x64.exe
```

`Install_3.7.bat` uses a different layout (`X:\OFFICE\…`, `X:\NEW PROGRAMS\…`, `X:\SNAPPY DRIVER\…`). Open the file and align the paths with your own drive before use.

## Usage

### Option A — Pico payload (unattended)

1. Flash `payload.dd` to the Pico with your DuckyScript tool.
2. Plug the prepared `X:` drive into the target PC.
3. Plug the Pico into the target PC. The payload starts typing immediately.
4. Wait for the installers to finish; progress is echoed to the console window.

### Option B — batch script (semi-attended)

1. Copy `Install_3.7.bat` next to your installers on the `X:` drive.
2. Double-click it and accept the UAC prompt (the script elevates itself).
3. Choose the Office version at the prompt:
   - `1` — Office 2010
   - `2` — Office 2016
4. The remaining applications install automatically, with progress markers at 25 / 50 / 75 %.

## Customisation

- **Change applications:** edit the `start` lines in `Install_3.7.bat` or the `STRING` lines in `payload.dd`.
- **Add delays:** increase `DELAY` values if the target machine is slow and keystrokes land before a window is ready.
- **Remove the Office prompt:** delete the `set /p` block in the batch file and hard-code your preferred installer.
- **Silent installs:** most installers accept `/S`, `/SILENT` or `/VERYSILENT`; the batch file already uses `/S` where available.

## Notes and limitations

- Timing is fixed. On very slow hardware, increase the `DELAY` values in `payload.dd`.
- The payload assumes a US keyboard layout — special characters in paths may type incorrectly on other layouts.
- Windows may show SmartScreen or UAC prompts that require a manual click.
- The script runs whatever is on `X:`; only use media you prepared yourself.

## Legal notice

This project only automates the execution of third-party installers. You are responsible for holding valid licences for every application you deploy, and for complying with the terms of the software you install.

## Author

**Mohamed Refaay** — [@mohammed20033](https://github.com/mohammed20033)
