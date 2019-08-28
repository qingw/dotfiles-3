;;; steamedfish/orgmode/config.el  -*- lexical-binding: t; -*-

(after! org
  ;; make org-ellipsis's face same as current heading,
  ;; instead of having its own
  (custom-set-faces!
   '(org-ellipsis :foreground nil))
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
        org-ellipsis (if (char-displayable-p ?⬎) "  ⬎" nil)
        org-startup-with-inline-images t)

  ;; refresh images after C-c C-c
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

  (when (featurep! :lang plantuml)
    (add-to-list 'org-src-lang-modes
                 '("plantuml" . plantuml))))

(after! org-clock
  (setq
   org-clock-into-drawer t
   org-clock-out-remove-zero-time-clocks t))

(use-package! ob-plantuml
  :after plantuml-mode
  :config
  (add-to-list 'org-babel-default-header-args:plantuml
               '(:cmdline . "-charset UTF-8")))
