;;; ~/dotfiles/.doom.d/config.el -*- lexical-binding: t; -*-
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
   ))
 )
