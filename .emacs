;; frame switch
(global-set-key "\M-`" 'other-frame)

;;; Turn on column-number-mode
(column-number-mode 1)

;;; Goto line with M-g
(global-set-key "\eg" 'goto-line)

;;; Switch window with M-<space>
(global-set-key "\M- " 'other-window)

;; no autosave pleeeeease
(setq auto-save-default nil)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path  "/Users/kristofhetzl/erlang_installations/21_3/lib/tools-3.1/emacs")
      (setq erlang-root-dir "/Users/kristofhetzl/erlang_installations/21_3/")
      (setq exec-path (cons "/Users/kristofhetzl/erlang_installations/21_3/bin" exec-path))
      (setq erlang-man-root-dir "/Users/kristofhetzl/erlang_installations/21_3/man")
      (require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.eterm?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.escript?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;;(add-to-list 'load-path "~/.emacs.d/share/distel/share/distel/elisp")
;;      (require 'distel)
;;      (distel-setup)

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(defun cj-quick-io-format ()
  (interactive)
  (save-excursion
    ;; (newline-and-indent)
    (insert "io:format(\"~p:~p:~p~n\", [self(), ?MODULE, ?LINE]),")
  )
)
(global-set-key (kbd "C-c C-t") 'cj-quick-io-format)

(defun badass-hashmark ()
  (interactive)
  (save-excursion
    (insert "#")
  )
)
(global-set-key (kbd "M-3") 'badass-hashmark)




(defun my-erlang-mode-hook ()
        (setq inferior-erlang-machine-options '("-sname" "emacs"))
        (imenu-add-to-menubar "imenu")
        (local-set-key [return] 'newline-and-indent)
)

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)


;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(load-theme 'misterioso)
