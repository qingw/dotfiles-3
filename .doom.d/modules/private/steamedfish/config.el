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

(add-hook! '(prog-mode text-mode conf-mode)
           #'doom-enable-show-trailing-whitespace-h)

(when (display-graphic-p)
  (when IS-MAC
    (setq-default
     ns-use-thin-smoothing t
     mac-system-move-file-to-trash-use-finder t))
  ; emacs-mac special
  (when (string-equal window-system "mac")
    (mac-auto-operator-composition-mode))
  (setq-default
   doom-font (font-spec :family "Fira Mono" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Fira Mono" :size 21))
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+steamedfish/toggle-transparency))

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
   :n "^"         (λ! (find-alternate-file ".."))))

(after! deft
  (setq-default deft-directory "~/Dropbox/org/"))

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))

(after! org
  (setq-default org-directory (expand-file-name "~/Dropbox/org/")
                diary-file (expand-file-name "~/Dropbox/org/diary")
                ;; all files but later.org should be put in agenda
                org-agenda-files
                (delete (expand-file-name "~/Dropbox/org/later.org")
                        (file-expand-wildcards (concat org-directory "*.org")))
                ;; one archive file instead of many
                org-archive-location
                (concat org-directory "archive.org::* From %s")
                org-log-done 'time
                org-log-done-with-time t)

  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

  ;; setup blog publish
  (unless (boundp 'org-publish-project-alist)
    (setq org-publish-project-alist nil))
  (add-to-list 'org-publish-project-alist
               `("org-blog"
                 ;; Path to your org files.
                 :base-directory "~/work/SteamedFish.github.io/org/"
                 :base-extension "org"

                 ;; Path to your Jekyll project.
                 :publishing-directory "~/work/SteamedFish.github.io/_posts"
                 :recursive t
                 :publishing-function org-html-publish-to-html
                 :language cn
                 :headline-levels 4
                 :html-extension "html"
                 :body-only t)) ;; Only export section between <body> </body>
  (add-to-list 'org-publish-project-alist
               `("org-blog-static"
                 :base-directory "~/work/SteamedFish.github.io/org/"
                 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
                 :publishing-directory "~/work/SteamedFish.github.io/_posts"
                 :recursive t
                 :publishing-function org-publish-attachment))
  (add-to-list 'org-publish-project-alist
               `("blog" :components ("org-blog" "org-blog-static"))))

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

;; (after! ivy-posframe
;;   (when (display-graphic-p)
;;     (setq ivy-display-function #'ivy-posframe-display-at-frame-bottom-left)))
