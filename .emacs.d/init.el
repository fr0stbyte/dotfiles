
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load (concat (getenv "HOME") "/.emacs.d/initialization"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories
   (quote
    ("/Users/radu/src/go/src/github.groupondev.com/conveyor-cloud/loadtest/pkg/apis/loadtest/v1alpha1")))
 '(package-selected-packages
   (quote
    (jenkins groovy-mode lua-mode wn-mode toml-mode racer helm-git-grep helm-gtags helm-cscope helm ggtags company-terraform cmake-mode clang-format cargo all-the-icons-dired all-the-icons neotree yaml-mode solarized-theme powerline marmalade markdown-mode magit go-eldoc go-autocomplete flycheck feature-mode company autopair auto-complete)))
 '(send-mail-function (quote smtpmail-send-it))
 '(terraform-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
