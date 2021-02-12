; tac (`cat` reverso)
; rui valporto, 2021

; função p/ obter arquivo
; "nome do arquivo" => ("cada" "uma" "das linhas")
;
(defun linhas (nome-do-arquivo)
  (with-open-file (stream nome-do-arquivo)
    (loop for line = (read-line stream nil)
          while line
          collect line)))

; função p/ reverter listas
; fonte: Tudor Jebelean, RISC–Linz, Mai 2010 
;
(defun R (L)
  (do ((L2 () (cons (car L1) L2))
       (L1 L (cdr L1)))
      ((eq L1 ())
       L2)))

; função principal
;
(defun main ()
  (let ((arquivo "")
        (reverso ()))
    
    (setq arquivo (cadr sb-ext:*posix-argv*))
    (setq reverso (R (linhas arquivo)))

    (loop for i in reverso
          do (format t "~a~%" i))))

(sb-ext:save-lisp-and-die "tac"
:executable t
:toplevel #'main)
