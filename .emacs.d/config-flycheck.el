;;; config-flycheck:
;;; Code:

(require 'flycheck)
(global-flycheck-mode)
(add-hook 'after-hook-init #'global-flycheck-mode)

(provide 'config-flycheck)
;;; config-flycheck ends here
