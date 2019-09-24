;;; steamedfish/chinese/config.el  -*- lexical-binding: t; -*-

(use-package! youdao-dictionary
  :config
  (setq-default
   url-automatic-caching t
   youdao-dictionary-search-history-file (concat doom-cache-dir "youdao.cache")
   youdao-dictionary-use-chinese-word-segmentation t)
  (map!
   :map youdao-dictionary-mode-map
   :n "q" #'quit-window
   :n "p" #'youdao-dictionary-play-voice-of-current-word
   :n "y" #'youdao-dictionary-play-voice-at-point)
  (if (display-graphic-p)
      (map!
       :leader
       :prefix ("h" . "help")
       :desc "Lookup Dictionary" :n "y"  #'youdao-dictionary-search-at-point-posframe)
    (map!
     :leader
     :prefix ("h" . "help")
     :desc "Lookup Dictionary"   :n "y"  #'youdao-dictionary-search-at-point+)))

(use-package! cal-china-x
  :after calendar
  :config
  (setq-default
   mark-holidays-in-calendar t
   cal-china-x-important-holidays cal-china-x-chinese-holidays
   calendar-holidays
   (append
    cal-china-x-important-holidays
    cal-china-x-general-holidays)))

(use-package! pyim
  :bind
  (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer))
  :config
  (if (display-graphic-p)
      (setq pyim-page-tooltip 'posframe)
    (setq pyim-page-tooltip 'popup))

  (setq default-input-method "pyim"
        pyim-default-scheme 'quanpin
        pyim-page-length 9
        pyim-dicts
        '((:name
           "pyim-bigdict"
           :file
           (expand-file-name (concat doom-private-dir "etc/pyim-bigdict.pyim")))))

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (pyim-isearch-mode 1))
