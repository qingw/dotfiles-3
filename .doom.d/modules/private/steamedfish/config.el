;;; private/steamedfish/config.el  -*- lexical-binding: t; -*-

(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com"
 frame-title-format '("%b - " user-full-name "'s Emacs")
 message-log-max 10000
 delete-by-moving-to-trash t)
(when IS-MAC (setq-default mac-system-move-file-to-trash-use-finder t))

(when (display-graphic-p)
  (when IS-MAC (setq-default ns-use-thin-smoothing t))

  (setq-default
   doom-font (font-spec :family "Source Code Pro" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Source Code Pro" :size 21)
   )

  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+steamedfish/toggle-transparency)
  )

(after! deft
  (setq-default deft-directory "~/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))
