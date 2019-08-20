;;; private/steamedfish/config.el  -*- lexical-binding: t; -*-

(setq
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com"
 frame-title-format '("%b - " user-full-name "'s Emacs")
 calendar-latitude 23.1247
 calendar-longitude 113.3612
 calendar-location-name "Tianhe, Guangzhou"
 message-log-max 10000
 delete-by-moving-to-trash t)

(add-hook! (prog-mode text-mode conf-mode)
  (setq show-trailing-whitespace t))

(when (display-graphic-p)
  (when IS-MAC
    (setq
     ns-use-thin-smoothing t
     mac-system-move-file-to-trash-use-finder t
     mac-command-modifier 'super
     mac-option-modifier  'meta))
  ;; emacs-mac special
  (when (string-equal window-system "mac")
    (mac-auto-operator-composition-mode))
  (setq
   doom-font (font-spec :family "Fira Mono" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Fira Mono" :size 21))
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+steamedfish/toggle-transparency))

(when IS-ANDROID
  (setq browse-url-browser-function 'browse-url-xdg-open))

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
  ;; make dired automatically refresh buffer after any file change
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (map!
   :map dired-mode-map
   ;; don't create new buffer when navigating
   :n "<return>"  #'dired-find-alternate-file
   :n "^"         (λ! (find-alternate-file ".."))))

(after! deft
  (setq deft-directory "~/Dropbox/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))

(after! org
  ;; make org-ellipsis's face same as current heading,
  ;; instead of having its own
  (custom-set-faces!
   `(org-ellipsis :foreground nil))
  (setq org-directory (expand-file-name "~/Dropbox/org/")
        diary-file (expand-file-name "~/Dropbox/org/diary")
        ;; all files but later.org should be put in agenda
        org-agenda-files
        (delete (expand-file-name "~/Dropbox/org/later.org")
                (file-expand-wildcards (concat org-directory "*.org")))
        ;; one archive file instead of many
        org-archive-location
        (concat org-directory "archive.org::* From %s")
        org-log-done 'time
        org-log-done-with-time t
        org-ellipsis (if (char-displayable-p ?⬎) "  ⬎" nil))

  ;; refresh images after C-c C-c
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images))

(after! projectile
  (projectile-add-known-project "~/dotfiles")
  (projectile-add-known-project "~/.emacs.d")
  (dolist (dir '("~/work/" "~/dumbo/" "~/Dropbox/" "~/Qsync/Work/" "~/dotfiles/"))
    (when (file-directory-p dir)
      (add-to-list 'projectile-project-search-path dir))))

(after! lsp-ui
  (setq lsp-ui-doc-position 'at-point
        lsp-ui-flycheck-enable t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-update-mode 'point
        lsp-ui-doc-enable t)
  (if (featurep 'xwidget-internal)
      (setq lsp-ui-doc-use-webkit t)))

(after! doom-modeline
  (setq doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-enable-word-count t
        doom-modeline-indent-info t))

(after! evil-escape
  (setq evil-escape-key-sequence nil))

;; (after! ivy-posframe
;;   (when (display-graphic-p)
;;     (setq ivy-display-function #'ivy-posframe-display-at-frame-bottom-left)))
