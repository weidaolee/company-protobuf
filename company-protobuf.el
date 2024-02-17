;;; company-protobuf.el --- company-mode keywords support for protobuf-mode

;; Authors: weidaolee <weidaolee@gmail.com>
;; Package-Requires: ((emacs "24") cl-lib company)
;; Package-Version: 0.1
;; Keywords: company protobuf
;; homepage: https://github.com/weidaolee/company-protobuf

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;;; Usage:
;;
;; To enable protobuf keywords, you need to add following config to your init file:
;;
;; (add-hook 'protobuf-mode-hook
;;           (lambda () (set (make-local-variable 'company-backends)
;;                           (append '((company-protobuf-keywords)) company-backends))))

;;; Code:

(require 'cl-lib)
(require 'company)

(defconst company-protobuf-keywords
  '(
    ;;; modifier
    "required" "optional" "repeated"

    ;;; type
    "double" "float" "int32" "int64" "uint32" "uint64" "sint32"
    "sint64" "fixed32" "fixed64" "sfixed32" "sfixed64" "bool"
    "string" "bytes" "group"

    ;;; type list
    "extensions" "to" "reserved"

    ;;; typeless decl
    "extend" "rpc" "option" "returns"

    ;;; constant
    "true" "false"

    ;;; struct decl
    "message" "enum" "service"

    ;;; other decl
    "package" "import"

    ;;; other
    "default" "max" "syntax"
    ))

;;;###autoload
(defun company-protobuf (command &optional arg &rest ignored)
  "Protobuf directive backend for the company mode."

  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-protobuf))
    (prefix (and (eq major-mode 'protobuf-mode)
                 (company-grab-symbol)))
    (candidates
     (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c)) company-protobuf-keywords))))

(provide 'company-protobuf)

;;; company-protobuf.el ends here
