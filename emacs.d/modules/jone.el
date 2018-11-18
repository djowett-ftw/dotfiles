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
    (pdb command)
    (rename-buffer command)))


(defun jone-plone-reload ()
  "Reload code in Plone with plone.reload."
  (interactive)
  (shell-command "plone-reload"))


(provide 'jone)
