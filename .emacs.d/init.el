(require 'package)

; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;reload
(global-set-key
 [f12] 'eval-buffer)

; Initialize
(package-initialize)

;; welcome
(setq inhibit-startup-message t)

;; menubar
(menu-bar-mode 0)

;; toolbar
(tool-bar-mode 0)

(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq initial-frame-alist
          '((top . 1) (left . 1) (width . 128) (height . 45)))

(set-language-environment "Japanese")
   (require 'mozc)  ; or (load-file "/path/to/mozc.el")
   (setq default-input-method "japanese-mozc")

;; helm setting
(require 'helm-config)
  (helm-mode t)

(when (require 'gist nil t)
  (when (require 'helm-gist nil t)
))

(when (require 'helm-gist nil t)
  (global-set-key (kbd "C-x C-g") 'helm-gist-find-files)
)

(require 'helm-descbinds)
  (helm-descbinds-mode)

;; markdown mode setting
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

;; rainbow-delimiters-mode
(defun my-rainbow-delimiters-mode-turn-on ()
  (rainbow-delimiters-mode t))
(add-hook 'emacs-lisp-mode-hook 'my-rainbow-delimiters-mode-turn-on)
(add-hook 'c-mode-common-hook 'my-rainbow-delimiters-mode-turn-on)


;; rainbow-mode
(defun my-rainbow-mode-turn-on ()
  (rainbow-mode t)
)
(add-hook 'css-mode-hook 'my-rainbow-mode-turn-on)
(add-hook 'htmk-mode-hook 'my-rainbow-mode-turn-on)


;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)


;;
;; YaTeX
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
;; (setq YaTeX-use-LaTeX2e t)
;; (setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("xdg-open\\|evince\\|okular\\|zathura\\|qpdfview\\|texworks\\|mupdf\\|firefox\\|chromium\\|acroread\\|pdfopen" . ".pdf")))
(setq tex-command "ptex2pdf -l -ot '-synctex=1'")
;;;(setq tex-command "ptex2pdf -u -l -ot '-synctex=1'")

(setq dvi2-command "evince")

(require 'magit)
(add-to-list 'exec-path "/usr/bin")

;; auto-complete-clang
(require 'auto-complete-config)
(require 'auto-complete-clang)

;;自動で補完画面を出すならt。補完キーを押すまで補完画面を出さないならnil
(setq ac-auto-start nil)

;;補完キー指定。お好みで。
(ac-set-trigger-key "TAB")
;;補完画面からさらにそのヘルプ画面が出るまでの遅延（秒）
(setq ac-quick-help-delay 0)

(defun my-ac-config ()
      (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))

(add-hook 'c++-mode-hook 'ac-cc-mode-setup)
(global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
    (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
    (setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")
    )

(my-ac-config)



