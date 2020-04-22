;;; templates --- install templates
;;; Commentary:
;;; Useful templates
;;; Code:
(define-skeleton paper-review-skeleton
  "Paper review skeleton for org-mode"
  "Paper review skeleton for org-mode"
  "* Overview[fn:1]\n"
  "** Type of paper(what is the niche)\n"
  ":examples:\n"
  "case study, system, theory / research paradigm, etc\n"
  ":END:\n"
  "** Motivation / Contribution\n"
  ":examples:\n"
  "new question, understanding, system, methodology, etc\n"
  ":END:\n"
  "** How are the claims substantiated\n"
  ":examples:\n"
  "argument, experiments, use cases, case studies, what makes the arguments scientific\n"
  ":END:\n"
  "** What are the lessons of the paper\n"
  "* Summary\n"
  "* Evaluation\n"
  "** Significance of problem\n"
  "** Significance of solution\n"
  "** Validity of claims (proof completeness and correctness, experimental setup)\n"
  "* Synthesis\n"
  "** Alternative approaches\n"
  "** What could be done better\n"
  "** New open questions\n"
  "** Can the results be applied somewhere else ?\n")
  "[fn:1] based on http://www2.cs.uregina.ca/~pwlfong/CS499/reading-paper.pdf"
(global-set-key "\C-cp" 'paper-review-skeleton)

(provide 'templates)
;;; templates.el ends here
