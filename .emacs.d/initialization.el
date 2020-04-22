;;; package --- Initialization
;;; Commentary:
;;; Code:
;; User details

(setq user-full-name "Radu Brumariu")
(setq user-mail-address "radu@groupon.com")

;; Environment
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/Users/radu/bin"
        (getenv "PATH")))
(setenv "GOPATH" (getenv "GOPATH"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))
(require 'cl)


(defun get-full-path (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path))

;; package management
(load (get-full-path "packages"))
;; startup options
(load (get-full-path "startup"))
;; load templates
(load (get-full-path "templates"))

;; keybindings
(setq mac-command-modifier 'super)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; package configuration
;;flycheck
(load (get-full-path "config-flycheck"))
;; autopair
(require 'autopair)
;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; helm
(require 'helm-config)
(helm-mode 1)
;; powerline
(require 'powerline)
(powerline-default-theme)
;; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")
;; GO
(require 'go-autocomplete)
(add-hook 'go-mode-hook
          (lambda ()
            (go-eldoc-setup)
            (add-hook 'before-save-hook 'gofmt-before-save)))
(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-k") 'pop-global-mark)))
;; themes
(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat t))

;; color codes
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;; neotree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; all-the-icons
(require 'all-the-icons)
;; rust
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
;; cc-mode
(require 'cc-mode)
(setq-default c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)
(require 'cmake-mode)
;; helm-git-grep
(require 'helm-git-grep)
(global-set-key (kbd "C-c g") 'helm-git-grep)
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))
;; helm-cscope
(require 'xcscope)
(cscope-setup)
(require 'helm-cscope)
(add-hook 'c-mode-common-hook 'helm-cscope-mode)
(add-hook 'helm-cscope-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'helm-cscope-find-global-definition)
            (local-set-key (kbd "M-@") 'helm-cscope-find-calling-this-function)
            (local-set-key (kbd "M-s") 'helm-cscope-find-this-symbol)
            (local-set-key (kbd "M-,") 'helm-cscope-pop-mark)))
;; mu4e
;; (require 'mu4e)
;; (require 'smtpmail)
;; (setq mu4e-maildir (expand-file-name "~/Maildir/GmailWork"))
;; don't save message to Sent Messages, GMail/IMAP will take care of this
;; (setq mu4e-drafts-folder "/[Gmail].Drafts"
;;       mu4e-sent-folder   "/[Gmail].Sent Mail"
;;       mu4e-trash-folder  "/[Gmail].Trash"
;;       user-mail-address  "radu@groupon.com"
;;       user-full-name     "Radu Brumariu"
;;       mu4e-get-mail-command "offlineimap"
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-local-domain "groupon.com"
;;       shr-color-visible-luminance-min 80
;;       mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")

;; setup some handy shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/GmailWork/INBOX"             . ?i)
;;         ("/GmailWork/[Gmail].Sent Mail" . ?s)
;;         ("/GmailWork/[Gmail].Trash"     . ?t))
;;       mu4e-completing-read-function 'completing-read
;;       mu4e-sent-messages-behavior 'delete
;;       message-kill-buffer-on-exit t
;;       mu4e-context-policy 'pick-first
;;       mu4e-confirm-quit nil
;;       )

;; terraform
(require 'company-terraform)
(company-terraform-init)
(custom-set-variables
  '(terraform-indent-level 2))
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
;; wn-mode
(require 'wn-mode)
(wn-mode)
(global-set-key (kbd "M-|") 'split-window-right)
(global-set-key (kbd "M--") 'split-window-below)
;; org-mode customizations
(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "BLOCKED" "VERIFY" "|" "DONE" "CANCELED")
        (sequence "IDEA" "|" "DONE")
        (sequence "MEETING" "|" "DONE"))
      )
(setq org-todo-keyword-faces
      '(("TODO" . "red")
        ("DOING" . "green")
        ("BLOCKED" . "yellow")
        ("VERIFY" . "purple")
        ("DONE" . (:foreground "green" :weight "bold"))
        ("CANCELED" . (:foreground "blue" :weight "bold"))))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(setq org-directory "/Users/radu/Dropbox/agenda")
(setq org-default-notes-file (concat org-directory "/notes/notes.org"))
(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
         "* TODO %?\n%u\n%a\n")
        ("i" "Idea" entry (file+datetree "~/Dropbox/agenda/notes/ideas.org")
         "* Ideas %? :IDEA: \n"))
      )
(setq org-startup-indented t
      org-hide-leading-stars t)

(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cn"
                (lambda () (interactive) (find-file "~/Dropbox/agenda/notes/notes.org")))
;; tab configuration
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(add-hook 'write-file-hooks
    (lambda () (if (not indent-tabs-mode)
                   (untabify (point-min) (point-max)))
      nil))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode" t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 2)

;; wakatime-mode
;; (global-wakatime-mode)

;; protobuf-mode
(require 'protobuf-mode)

;; ox-beamer
(require 'ox-beamer)
(require 'ox-latex)
(setq org-export-allow-bind-keywords t)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(org-babel-do-load-languages 'org-babel-load-languages '((shell . t) (python . t) (latex . t)))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        ))
(provide 'initialization)
;;; initialization.el ends here
