;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/.doom.d/modules/intl/chinese/packages.el

(if (featurep! cnfontx)
    (package! cnfonts))
(package! youdao-dictionary)
(package! cal-china-x)
(package! pangu-spacing
  :disable t)
