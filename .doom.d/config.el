(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com")

(when IS-MAC
  (setq-default
   ns-use-thin-smoothing t)

  ;; TODO: doom uses the following configs, but I cannot make it right
  ;;(setq-default
  ;;  doom-font (font-spec :family "Source Code Pro" :size 14)
  ;;  doom-variable-pitch-font (font-spec :family "Fira Sans")
  ;;  doom-unicode-font (font-spec :family "DejaVu Sans Mono")
  ;;  doom-big-font (font-spec :family "Source Code Pro" :size 21)
  ;; )
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  "Source Code Pro" 14))
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Hiragino Sans GB" :size 16)))

  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'toggle-transparency)
)

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(90 . 80) '(100 . 100)))))
(map!
 (:leader
   (:desc "toggle" :prefix "t"
     :desc "Transparency"  :n "t" #'toggle-transparency
     )))

(setq-default fcitx-active-evil-states '(insert emacs hybrid))
(fcitx-aggressive-setup)

(setq-default deft-directory "~/org/")

(after! yasnippet
  (push "~/.doom.d/snippets" yas-snippet-dirs))
