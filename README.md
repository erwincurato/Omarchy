# Omarchy Setup

This repo contains my Omarchy post-install setup with personal dotfiles.

**Status:** In Progress

---

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/078a9494-dc37-4ee7-87f1-2856d8943b5a" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/28faef95-ba62-4f51-b454-13d59545296e" />
<img width="1915" height="1080" alt="image" src="https://github.com/user-attachments/assets/ba3b1b67-0240-4796-8cc2-ff4957fb991e" />




## What this setup does

1. **Install Omarchy** using the official installer.  
2. **Backup existing configs** from `~/.config/*` that match the dotfiles in this repo.  
   - Backups are stored in `~/Projects/omarchy-backups/YYYY-MM-DD_HH-MM-SS`  
   - A symlink `latest` points to the most recent backup.  
3. **Apply personal dotfiles** by copying them into `~/.config/`.  
   - Currently includes only Waybar.  
4. **Optional symlink creation**  
   - After dotfiles are applied, the script asks if you want to create direct symlinks from your repo to `~/.config/` for instant updates.  

---

## Future Plans

- Add more dotfiles (Hyprland, Kitty, etc.)  
- Improve symlink automation  
- Make script more public-friendly


