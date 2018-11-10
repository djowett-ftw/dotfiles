
(defun jone-setup-robot-mode ()
  (load (concat (cabbage-vendor-library-dir 'robot-mode) "robot-mode"))
  (add-to-list 'auto-mode-alist '("/tests/.*\\.txt\\'" . robot-mode))

  (define-key robot-mode-map (kbd "M-e") 'jone-execute-robot-tests))

(add-hook 'cabbage-initialized-hook 'jone-setup-robot-mode)


(defun jone-setup-robot-mode-testing ()
  (when (and buffer-file-name (string-match "/tests" buffer-file-name))
    (setq cabbage-testing-execute-function
          'cabbage-plone--run-single-file-tests)))

(add-hook 'robot-mode-hook 'cabbage-plone--python-setup-testing)
