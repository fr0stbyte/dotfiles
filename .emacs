;; contacts
(setq user-full-name "Radu Brumariu")
(setq user-mail-address "fr0stbyte@users.noreply.github.com")

;; to setup tabs
(setq-default tab-width 2
              indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; elang mode bits
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.7.1/emacs/" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))

(require 'erlang-start)
;; (add-to-list 'load-path ".emacs.d/color-theme-sanityinc-solarized/")

;; package management
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(require 'cl)

;; (require 'color-theme)
;; (require 'color-theme-sanityinc-solarized)
;; (load-theme 'color-theme-sanityinc-solarized-light t)
;; (setq solarized-high-contrast-mode-line t)

;; default packages
(defvar radu/packages '(ac-slime
                        auto-complete
                        autopair
                        coffee-mode
                        deft
                        dockerfile-mode
                        erlang
                        feature-mode
                        flycheck
                        gist
                        go-mode
                        graphviz-dot-mode
                        magit
                        markdown-mode
                        marmalade
                        nodejs-repl
                        org
                        paredit
                        restclient
                        scala-mode
                        smex
                        solarized-theme
                        web-mode
                        writegood-mode
                        yaml-mode)
  "Default packages")

(defun radu/packages-installed-p ()
  (loop for pkg in radu/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))
(unless (radu/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg radu/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(setq inhibit-splash-screent t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

  
(load-theme 'solarized-light t)                    

;; column mode
(setq column-number-mode t)

;; close parens
(require 'autopair)

;; turn on autocomplete
(require 'auto-complete-config)
(ac-config-default)

;;(require 'coffee-mode)
;;(require 'json-mode)
;;(autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; adding /usr/local/bin to exec-path
(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))
