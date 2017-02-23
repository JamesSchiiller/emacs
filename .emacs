;; tabs
(setq default-tab-width 2)
(global-set-key (kbd "TAB") 'self-insert-command)

(require 'package)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/"))

;; neotree
;(add-to-list 'load-path "/home/james/.emacs.d/elpa/neotree-20160306.730/")
;(require 'neotree)
;(setq inferior-lisp-program "/usr/bin/sbcl")
;(global-set-key [f8] 'neotree-toggle)

;; set lisp location
(setq inferior-lisp-program "/usr/bin/sbcl")

;; switch windows form horizontal split to vertical and v.v.
(defun toggle-window-split ()
	(interactive)
	(if (= (count-windows) 2)
			(let* ((this-win-buffer (window-buffer))
						 (next-win-buffer (window-buffer (next-window)))
						 (this-win-edges (window-edges (selected-window)))
						 (next-win-edges (window-edges (next-window)))
						 (this-win-2nd (not (and (<= (car this-win-edges)
																				 (car next-win-edges))
																		 (<= (cadr this-win-edges)
																				 (cadr next-win-edges)))))
						 (splitter
							(if (= (car this-win-edges)
										 (car (window-edges (next-window))))
									'split-window-horizontally
								'split-window-vertically)))
				(delete-other-windows)
				(let ((first-win (selected-window)))
					(funcall splitter)
					(if this-win-2nd (other-window 1))
					(set-window-buffer (selected-window) this-win-buffer)
					(set-window-buffer (next-window) next-win-buffer)
					(select-window first-win)
					(if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x |") 'toggle-window-split)

;; switch windows easily, allow c x up/down/left/right arrows:
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

																				;(set-default-font "Monaco 10")

(when (< emacs-major-version 24)
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
