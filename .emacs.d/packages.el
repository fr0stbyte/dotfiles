;;; packages --- install packages
;;; Commentary:
;;; Packages wanted
;;; Code:
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar radu/packages '( all-the-icons
                         all-the-icons-dired
                         auto-complete
                         autopair
                         cargo
                         cc-mode
                         clang-format
                         cmake-mode
                         company
                         company-terraform
                         feature-mode
                         flycheck
                         ggtags
                         go-autocomplete
                         go-eldoc
                         go-mode
                         helm
                         helm-cscope
                         ;;lua-mode
                         xcscope
                         helm-gtags
                         helm-git-grep
                         magit
                         markdown-mode
                         marmalade
                         neotree
                         org
                         powerline
                         protobuf-mode
                         racer
                         rust-mode
                         solarized-theme
                         ;;                         smtpmail
                         terraform-mode
                         toml-mode
                         wakatime-mode
                         yaml-mode
                         wn-mode)
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

(package-initialize)


(setq package-archive-enable-alist '(("melpa" magit f)))

(provide 'packages)
;;; packages.el ends here
