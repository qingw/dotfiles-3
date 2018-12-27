(setq-default
 user-full-name "SteamedFish"
 user-mail-address "steamedfish@hotmail.com")

(when IS-MAC
  (setq-default ns-use-thin-smoothing t)
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
