# 🎬 TMDB-To-VOD  
**Free Live TV, Movies & Series Playlists (Xtream Codes & M3U8)**

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](#-docker-quickstart)
[![License](https://img.shields.io/github/license/gogetta69/TMDB-To-VOD-Playlist)](LICENSE)
[![Download ZIP](https://img.shields.io/badge/Download-ZIP-blue?logo=github)](https://github.com/gogetta69/TMDB-To-VOD-Playlist/archive/refs/heads/main.zip)
[![Ko-fi](https://img.shields.io/badge/Support-Ko--fi-ff5f5f?logo=kofi)](https://ko-fi.com/gogetta69)

---

## 📚 Table of Contents
- [Latest Update](#-latest-update)
- [Summary](#-summary)
- [Screenshots](#-screenshots)
- [Features](#-features)
- [Getting Started (Non-Docker)](#-getting-started-non-docker)
- [Docker Quickstart](#-docker-quickstart)
  - [What the Compose Services Do](#what-the-compose-services-do)
  - [Files Added for Docker](#files-added-for-docker)
- [Creating Playlists](#-creating-playlists)
- [What is HeadlessVidX?](#-what-is-headlessvidx)
- [Changes & Additions](#-changes--additions)
- [Credits](#-credits)
- [Legal](#-legal)

---

## 🆕 Latest Update — 2025-09-28
- **Live TV:** Fixed Live TV and added [DrewLive](https://github.com/Drewski2423/DrewLive) (7,000+ channels).  
- **Real Debrid:** Fixed cache checks; added Streamio Sites as a Debrid source (more coming).  
- **Stream Sources:** Pruned/cleaned direct sources in main app + HeadlessVidX for reliability.  
- **Adult VOD:** Fixed; 10k-title library refreshes every Sunday (disabled by default).  
- **HeadlessVidX:** Major overhaul and stabilization.  
- **Overall:** After a long gap, the project is back on track with more features planned.

---

## 🧾 Summary
Create **Live TV**, **Movies**, and **TV Series** VOD playlists using **Xtream Codes** or **M3U8** formats.  
The app builds dynamic playlists with metadata via **TMDB**, **Real-Debrid**, **Premiumize**, and direct sources.  
Works great with **iMPlayer**, **TiviMate**, **IPTV Streamers Pro**, **XCIPTV**, and more.

**Demo video:**  
![Demo GIF](https://github.com/user-attachments/assets/7925cf0a-63b7-43ab-8a1e-d099306985fe)

---

## 🖼 Screenshots
| | | |
|---|---|---|
| ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110311.png) | ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110433.png) | ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110501.png) |
| ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110535.png) | ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110653.png) | ![](https://github.com/gogetta69/TMDB-To-VOD-Playlist/raw/main/images/101623110819.png) |

> More images are available in the repository’s `images/` folder.

---

## ✅ Features
- Dynamic playlists for **Live TV**, **Movies**, and **TV Series**
- Integrations: **TMDB**, **Real-Debrid**, **Premiumize**, and direct sources
- **Xtream Codes** emulation with full metadata
- Live TV sources: [Daddylive](https://dlhd.so/24-7-channels.php), [TheTVApp](https://thetvapp.to/), [MoveOnJoy](https://i.imgur.com/dFazdys.png), [Streamed Su Sports](https://streamed.pk/), [Pluto TV](https://downloads.pluto.tv/docs/pluto_tv_channels_listing.pdf)
- Most channels include detailed **EPG**
- Smart caching for smooth playback
- **Adult VOD** section (10k+ titles, disabled by default)

---

## 🛠 Getting Started (Non-Docker)
1. Get a free [TMDB API Key](https://developer.themoviedb.org/docs/getting-started).  
   (Optional) Add [Real-Debrid](https://real-debrid.com/apitoken) or [Premiumize](https://www.premiumize.me/account) keys.
2. Use **Xtream Codes Mode** (no login required) to automatically load playlists.
3. Non-XC apps can use the generated `playlist.m3u8` file (Movies & Live TV only).
4. Playbacks are cached for 3 hours for better performance.
5. Optionally run locally via **XAMPP**.

---

## 🐳 Docker Quickstart
**Docker integration and modernization by [Vendza](https://github.com/vendza).**

```bash
git clone https://github.com/gogetta69/TMDB-To-VOD-Playlist.git
cd TMDB-To-VOD-Playlist
cp .env.example .env
# Edit .env with your API keys and tokens
docker compose up -d
```
➡ Visit **http://localhost:41063** or the port you mapped.

### What the Compose Services Do
| Service | Description |
|----------|-------------|
| **tmdbtovod** | PHP 8.2 + Apache container hosting the dashboard & backend |
| **headlessvidx** | Browser automation & metadata extractor for stream links |

### Files Added for Docker
| File | Purpose |
|------|----------|
| `docker-compose.yml` | Defines the containers and environment |
| `.env.example` | Example file for environment variables |
| `.gitignore` | Excludes sensitive data and runtime folders |

**Sample `.env`**
```dotenv
TZ=America/Los_Angeles
APP_PORT=41063
HEADLESSVIDX_PORT=3202
TMDB_API_KEY=your_tmdb_api_key_here
REALDEBRID_TOKEN=your_realdebrid_token_here
PREMIUMIZE_API_KEY=
HEADLESSVIDX_ADDRESS=headlessvidx:3202
```

---

## 🧩 Creating Playlists
Playlists are **automatically generated twice daily** via GitHub Actions.  
To build manually, set the following in `config.php`:

```php
$userCreatePlaylist = true;
```

---

## 🧠 What is HeadlessVidX?
HeadlessVidX lets you visually create and test extractors for streaming sites—no coding required.

| Home | Trainer |
|------|----------|
| ![](https://raw.githubusercontent.com/gogetta69/TMDB-To-VOD-Playlist/main/images/Screenshot%202024-06-14%20at%2016-41-13%20HeadlessVidX%20-%20Home.png) | ![](https://raw.githubusercontent.com/gogetta69/TMDB-To-VOD-Playlist/main/images/Screenshot%202024-06-14%20at%2016-40-15%20HeadlessVidX%20-%20Trainer.png) |

---

## 🔧 Changes & Additions
- Added **Premiumize** as Real-Debrid alternative
- Implemented **multi-threaded** torrent searches
- Improved extractor reliability and source coverage
- Added **TheTVApp Sports** + **PlutoTV**
- Redesigned **Live TV / DaddyLive** playlists (with artwork)
- Optimized torrent filters and resolution sorting
- Added optional **Adult VOD** mode

---

## 🙌 Credits
- **Original Creator:** [gogetta69](https://github.com/gogetta69)  
- **Docker Integration, Modernization & UI Enhancements:** [Vendza](https://github.com/vendza)  
- **Additional Live TV Source:** [Drewski2423 / DrewLive](https://github.com/Drewski2423/DrewLive)

> ⭐ Star the repo and consider supporting on [Ko-fi](https://ko-fi.com/gogetta69)!

---

## ⚖️ Legal
This software retrieves metadata and links from third-party sources.  
Use responsibly. Accessing copyrighted material without permission may be illegal.  
Always follow applicable laws and site terms.
