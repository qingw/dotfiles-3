;;; private/steamedfish/config.el  -*- lexical-binding: t; -*-

(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com"
 frame-title-format '("%b - " user-full-name "'s Emacs")
 calendar-latitude 23.1247
 calendar-longitude 113.3612
 calendar-location-name "Tianhe, Guangzhou"
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
   doom-big-font (font-spec :family "Source Code Pro" :size 21))
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+steamedfish/toggle-transparency))

(after! projectile
  (projectile-add-known-project "~/dotfiles")
  (projectile-add-known-project "~/.emacs.d"))
  ;; TODO add all dumbo repo here

(after! google-this
  (google-this-mode 1)
  ;; FIXME this keybinding is not working correctly
  (map!
   :leader
   :prefix ("h" . "help")
   :desc "Google Search"               :n "g"  #'google-this-mode-submap))

(after! dired
  ;; emacs by default disable this command
  (put 'dired-find-alternate-file 'disabled nil)
  (map!
   :map dired-mode-map
   ;; don't create new buffer when navigating
   :n "<return>"  #'dired-find-alternate-file
   :n "^"         #'(lambda ()
                      (interactive)
                      (find-alternate-file ".."))))

(add-hook! (text-mode prog-mode conf-mode snippet-mode)
  (setq show-trailing-whitespace t))

(after! deft
  (setq-default deft-directory "~/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))

(after! org
  (setq-default org-directory (expand-file-name "~/org/")
                diary-file (expand-file-name "~/org/diary")
                ;; all files but later.org should be put in agenda
                org-agenda-files
                (delete (expand-file-name "~/org/later.org")
                        (file-expand-wildcards (concat org-directory "*.org")))
                ;; one archive file instead of many
                org-archive-location
                (concat org-directory "archive.org::* From %s")
                org-log-done 'time
                org-log-done-with-time t)
  (map!
   :map evil-org-mode-map
   :localleader
   :desc "Create/Edit Todo"  "t"  #'org-todo
   :desc "Schedule"          "s"  #'org-schedule
   :desc "Deadline"          "d"  #'org-deadline
   :desc "Refile"            "r"  #'org-refile
   :desc "Filter"            "f"  #'org-match-sparse-tree
   :desc "Tag heading"       "T"  #'org-set-tags-command))
