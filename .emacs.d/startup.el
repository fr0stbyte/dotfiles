;;; package --- Startup
;;; startup :
;;; Commentary:
;;; Code:

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; text editing settings
(setq tab-width 2
      column-number-mode t
      indent-tabs-mode nil
      make-backup-files nil
      visible-bell t)
(show-paren-mode t)

(provide 'startup)
;;; startup ends here
