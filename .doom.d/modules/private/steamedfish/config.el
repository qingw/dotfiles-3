;;; private/steamedfish/config.el  -*- lexical-binding: t; -*-

(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com")

(when (display-graphic-p)
  (when IS-MAC (setq-default ns-use-thin-smoothing t))

  (setq-default
   doom-font (font-spec :family "Source Code Pro" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Source Code Pro" :size 21)
   )

  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+default/toggle-transparency)
  )

(map!
 (:leader
   (:desc "toggle" :prefix "t"
     :desc "Transparency" :n "t" #'+default/toggle-transparency)))

(after! deft
  (setq-default deft-directory "~/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))
