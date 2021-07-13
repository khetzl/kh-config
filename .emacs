;; no startup screen
(setq inhibit-startup-screen t)?

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

;; my theme
(load-theme 'misterioso t)

;; github rust magic
;; keep my personal settings not in the .emacs file
;; http://www.mygooglest.com/fni/dot-emacs.html
;; load it if it exists
;;(let ((personal-settings "~/emacs-rust-config/standalone.el"))
;; (when (file-exists-p personal-settings)
;;   (load-file personal-settings))
;;)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-user-dir (expand-file-name "elpa/" user-emacs-directory))
(package-initialize)

;; Install use-package that we require for managing all other dependencies

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; I find these light-weight and helpful

(use-package which-key
  :ensure
  :init
  (which-key-mode))

(use-package selectrum
  :ensure
  :init
  (selectrum-mode)
  :custom
  (completion-styles '(flex substring partial-completion)))

(load-file (expand-file-name "init.el" user-emacs-directory))

