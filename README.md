<div align="center">

# 🚀 uenofetch

Minimal cross-platform system information tool inspired by **neofetch**  
Built with PowerShell 💻🔥

![PowerShell](https://img.shields.io/badge/PowerShell-7+-blue?logo=powershell)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-success)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/version-1.0.0-orange)

</div>

---

## ✨ Preview

```bash
uenofetch
```

Displays:

- 🖥 OS
- 🧠 CPU
- 🎮 GPU
- 💾 RAM usage
- 📀 Disk usage
- ⏳ Uptime
- 🎨 Custom ASCII logo

---

# 📦 Installation

## 🪟 Windows (PowerShell 7 Recommended)

Open PowerShell and run:

```powershell
iwr -useb https://raw.githubusercontent.com/TU_USUARIO/uenofetch/main/install.ps1 | iex
```

Restart your terminal and run:

```powershell
uenofetch
```

---

## 🐧 Linux

Make sure PowerShell 7 is installed:

```bash
sudo apt install powershell
```

Then run:

```bash
curl -s https://raw.githubusercontent.com/TU_USUARIO/uenofetch/main/install.ps1 | pwsh
```

After installation:

```bash
uenofetch
```

---

## 🍎 macOS

Install PowerShell:

```bash
brew install --cask powershell
```

Then:

```bash
curl -s https://raw.githubusercontent.com/TU_USUARIO/uenofetch/main/install.ps1 | pwsh
```

---

# 🛠 Manual Installation

```bash
git clone https://github.com/TU_USUARIO/uenofetch.git
cd uenofetch
pwsh install.ps1
```

---

# ⚡ Requirements

- PowerShell 7+
- Windows / Linux / macOS

Check version:

```powershell
$PSVersionTable
```

---

# 🎨 Features

- ✅ Cross-platform support
- ✅ Clean colored output
- ✅ RAM & Disk usage percentage
- ✅ Lightweight
- ✅ No external dependencies
- ✅ Custom ASCII logo

---

# 🔮 Roadmap

- [ ] Theme support
- [ ] Minimal mode (`--minimal`)
- [ ] Version flag (`--version`)
- [ ] Auto-update command
- [ ] Linux GPU detection
- [ ] Distro-based ASCII logos

---

# 🤝 Contributing

Contributions are welcome!

1. Fork the project  
2. Create your feature branch  
3. Commit your changes  
4. Push to the branch  
5. Open a Pull Request  

---

# 📜 License

MIT License

---

<div align="center">

Made with ❤️ by Marcelo

</div>
