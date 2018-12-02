(defun jone-locate-first-dominating-file (patterns &optional startpath)
  "Look up the directory hirearchy and search for the first match of patterns
at the nearest location."
  (let ((startpath (or startpath buffer-file-name)))
    (first
     (-non-nil
      (mapcar (lambda (pattern)
                (let ((match (locate-dominating-file startpath pattern)))
                  (if match (concat match pattern))))
              patterns)))))


(defun jone-make-changelog-entry ()
  "Make a new changelog entry in the nearest changelog file found."
  (interactive)
  (let ((changelog (jone-locate-first-dominating-file '("docs/HISTORY.txt"
                                                        "CHANGELOG.txt")))
        (author (user-login-name)))

    (when changelog
      (find-file changelog)
      (goto-char (point-min))
      (forward-paragraph 2)

      ;; Remove "- Nothing changed yet", if it is there.
      (mark-paragraph)
      (replace-string "\n- Nothing changed yet.\n" "")

      (newline)
      (insert "- ")
      (insert (concat " [" author "]"))
      (newline)
      (forward-line -1)
      (beginning-of-line)
      (forward-char 2))))


(defun jone-sort-lines-at-point ()
  "Sorts lines of the block at point."
  (interactive)
  (mark-paragraph)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))


(defun jone-discover-projects-and-switch ()
  "First discover projects in ~/projects, then open a new project."
  (interactive)
  (projectile-discover-projects-in-search-path)
  (projectile-cleanup-known-projects)
  (call-interactively 'projectile-persp-switch-project))


(defun jone-run-server-in-pdb-mode ()
  "Start the nearest supported server (zope instance, ..) in pdb-mode."
  (interactive)
  (let* ((program (jone-locate-first-dominating-file '("bin/instance")))
	 (command (concat program " fg")))
    (if (get-buffer command) (kill-buffer command))
    (pdb command)
    (rename-buffer command)))


(defun jone-plone-reload ()
  "Reload code in Plone with plone.reload."
  (interactive)
  (shell-command "plone-reload"))


(defvar jone--prev-test-command nil)

(defun jone-run-tests ()
  "Run tests of this file or the last ran test."
  (interactive)
  (let ((new-command (jone--test-command-for-buffer))
        (test-buffer-name "*test*"))
    (if new-command
        (setq jone--prev-test-command new-command))
    (if (get-buffer test-buffer-name) (kill-buffer test-buffer-name))
    (pdb jone--prev-test-command)
    (rename-buffer test-buffer-name)))


(defun jone--test-command-for-buffer ()
  (if buffer-file-name
      (cond
       ((string-match "test_.*\.py$" buffer-file-name)
        (jone--plone-test-command)))))


(defun jone--plone-test-command ()
  (let ((program (jone-locate-first-dominating-file '("bin/test"))))
    (if program
        (let ((dottedname (replace-regexp-in-string "/" "." (file-name-sans-extension (file-relative-name buffer-file-name (concat program "../../.."))))))
          (concat program " -t " dottedname)))))


(provide 'jone)
