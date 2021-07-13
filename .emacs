;; no startup screen
(setq inhibit-startup-screen t)?

;; links
;;(setq vc-handled-backends nil)
;;(add-to-list 'exec-path "/usr/local/Cellar/direnv/2.28.0/bin")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; line numbers
(global-linum-mode t)

;; frame switch
(global-set-key "\M-`" 'other-frame)

;; Turn on column-number-mode
 (column-number-mode 1)

;; Goto line with M-g
(global-set-key "\M-g" 'goto-line)

;;; Switch window with M-<space>
(global-set-key "\M- " 'other-window)

;; no autosave pleeeeease
(setq auto-save-default nil)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; No lockfiles
(setq create-lockfiles nil)

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;;(global-set-key (kbd "C-c C-c") 'comment-region)
;;(global-set-key (kbd "C-k C-c C-c") 'uncomment-region) ;; This is default

;; OSX hashmark
(define-key key-translation-map (kbd "M-3") (kbd "#"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(exec-path-from-shell toml-mode company yasnippet flycheck lsp-ui lsp-mode rustic selectrum which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-user-dir (expand-file-name "elpa/" user-emacs-directory))
(package-initialize)


;; my theme
;; (load-theme 'misterioso t)

;; lsp
(use-package direnv
  :init
  (add-hook 'prog-mode-hook #'direnv-update-environment)
  :config
  (direnv-mode))
  
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1))

(use-package lsp-mode
  :after (direnv evil)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-snippet nil)
  (require 'lsp-clients))

;;(use-package lsp-ui)
(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package rust-mode
  :hook (rust-mode . lsp))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(setq rust-format-on-save t)
