# SD-AntiLag

**SD-AntiLag** is a lightweight SteamOS utility that helps reduce SD card stutter by periodically writing a small file to the SD card, preventing aggressive power-saving stalls.

It was originally built for the **ROG Ally X**, but should work on **any device running SteamOS** (including the Steam Deck and similar non-Valve handhelds).

The app features a simple GUI, adjustable write intervals, and an optional background service that can persist across reboots — all **without requiring sudo or Python installs**.

---

## Features

- Simple, clean GUI  
- Adjustable write interval (1–10 seconds)  
  - **3 seconds recommended** (default)  
- Changeable keepalive file name  
  - Defaults to `SD-AntiLag_File`  
- Foreground or background mode  
- Optional background service (persists across reboots)  
- Live updates when settings change  
- No root / sudo required  
- No Python required (standalone binary)  
- Designed for **SteamOS-based handheld devices**

---

## Installation (SteamOS)

### Recommended (Desktop Mode)

1. Switch your device to **Desktop Mode**
2. Open **Konsole**
3. Run:

```bash
git clone https://github.com/AXHMR/SD-AntiLag.git
cd SD-AntiLag
chmod +x install.sh
./install.sh
