;;; check-pls.el --- a minor mode to check checkboxes  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Paul W. Rankin

;; Author: Paul W. Rankin <hello@paulwrankin.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(defvar check-pls-regexp
  "\\[\\([Xx ]\\)\\]"
  "Regular expression for matching checkboxes.")

(defun check-pls-toggle ()
  "Toggle the checked state of a checkbox on current line.
A checkbox matches the regular expression `check-pls-regexp'."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (re-search-forward check-pls-regexp (line-end-position) t)
      (replace-match (if (string-equal (match-string 0) "[ ]")
                         "[x]" "[ ]")))))

(define-minor-mode check-pls-mode
  "Provides `check-pls-toggle' command."
  :lighter " [x]"
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") #'check-pls-toggle)
    map))

(provide 'check-pls)
;;; check-pls.el ends here
