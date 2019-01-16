;;; private/steamedfish/config.el  -*- lexical-binding: t; -*-

(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com"
 frame-title-format '("%b - " user-full-name "'s Emacs")
 calendar-latitude 23.1247
 calendar-longitude 113.3612
 calendar-location-name "Tianhe, Guangzhou"
 diary-file "~/org/diary"
 message-log-max 10000
 delete-by-moving-to-trash t)

(when (display-graphic-p)
  (when IS-MAC
    (setq-default
     ns-use-thin-smoothing t
     mac-system-move-file-to-trash-use-finder t))

  (setq-default
   doom-font (font-spec :family "Source Code Pro" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Source Code Pro" :size 21)
   )

  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+steamedfish/toggle-transparency)
  )

(add-hook! (text-mode prog-mode conf-mode snippet-mode)
  (setq show-trailing-whitespace t))

(after! deft
  (setq-default deft-directory "~/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))
