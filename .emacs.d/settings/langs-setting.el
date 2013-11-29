;; C++
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c++-mode-hook
'( lambda ()
   (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
   (add-to-list 'ac-sources 'ac-source-yasnippet)
   (flymake-mode t)
))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(add-to-list 'auto-mode-alist '("\\wscript$" . python-mode))

;; Python
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "blue")
(set-face-background 'highlight-indentation-current-column-face "red")
(setq python-mode-hook
      '(lambda ()
         (highlight-indentation-mode t)
         (flymake-mode t)
         ))

;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
