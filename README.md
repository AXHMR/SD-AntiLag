# SD-AntiLag

**SD-AntiLag** is a lightweight SteamOS utility that helps reduce SD card stutter by periodically writing a small file to the SD card, preventing aggressive power-saving stalls.

It was originally built for the **ROG Ally X**, but _should_ work on other devices running Steam OS (including the Steam Deck and similar non-Valve handhelds).

The app features a simple GUI, adjustable write intervals, and an optional background service that can persist across reboots — all **without requiring sudo or Python installs**.

---

## Features

- Simple, clean GUI  
- Adjustable write interval (1–10 seconds)  
  - **3 seconds recommended** (default)  
- Changeable _"keepalive"_ file name  
  - Defaults to `SD-AntiLag_File`  
- Foreground or background mode  
- Optional background service (persists across reboots)  
- Live updates when settings change  
- No root / sudo required  
- No Python required (standalone binary)  
- Designed for **SteamOS devices** with problematic SD-Card stuttering

---

## Installation (SteamOS)

1. Switch your device to **Desktop Mode**
2. Open **Konsole**
3. **Run** _(**Paste** and **Execute** command)_:

```bash
curl -fsSL https://raw.githubusercontent.com/AXHMR/SD-AntiLag/main/install.sh | bash
```

### After installation:

- SD-AntiLag appears in the Application Launcher
- A Desktop icon is created automatically
- You may also add it to Steam as a Non-Steam Game _if desired!_

---

## Running SD-AntiLag

### You can launch SD-AntiLag from:
- The Desktop icon
- The Application Launcher
- Steam (if added as a Non-Steam Game)

### Controls:
- Start / Stop
    - Starts or stops SD-AntiLag.
- Write Interval
    - Controls how often the SD card is written to.
- Run in Background
    - Enables a systemd user service that persists across reboots.
- Status Indicator
    - Shows the current running state.
All settings are saved automatically.

---

## Background Mode (Important)

### When Run in background is enabled:
- SD-AntiLag runs as a systemd user service
- It continues running after reboot
- No sudo is required
- To stop or change background settings, reopen SD-AntiLag.

---

## Uninstalling

To completely remove SD-AntiLag, run the following command in **Konsole**:
```bash
curl -fsSL https://raw.githubusercontent.com/AXHMR/SD-AntiLag/main/uninstall.sh | bash
```

### This removes:
- The SD-AntiLag application files
- The Desktop shortcut
- The Application Launcher entry

No reboot is required.

---

## Notes:
- SD-AntiLag performs a minimal (1 Byte) write operation only
    - For example: Running every 3 seconds, for 24 hours a day, over an entire year = ~10 MB.
- No user data is deleted automatically
- The application does not modify system files
- Background operation is user-level only

At some point in the near future, I hope to be able to turn this all into a super light-weight _(Much less than the __56MB__ or so that this is!!!)_ decky plugin. But that is a challenge for another day!

---

## Acknowledgements
Inspired by community research into SD card power-saving behavior on modern handhelds running Steam OS. - Thank you [Ardetis](https://github.com/Ardetis)!

Being the car nerd I am, I named this app "SD-AntiLag" because I feel the application does something similar to what Anti-Lag does in a car, keeps things going so you don't have to wait!

While this app was created with the ROG Ally X in mind, It _SHOULD_ work on most _(if not all)_ devices running Steam OS. **If** you happen to try this on another device, please let me know, and I will work of building out a list.
