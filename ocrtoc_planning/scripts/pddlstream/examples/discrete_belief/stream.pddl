(define (stream belief)
  (:function (MoveCost))
  (:function (LookCost ?o ?d ?l ?ob)
    (and (Dist ?o ?d) (Location ?l) (Obs ?ob))
  )
  (:predicate (BCollision ?l ?o ?d)
    (and (Location ?l) (Dist ?o ?d))
  )
  (:stream ge
    :inputs (?o ?d ?l ?p)
    :domain (and (Dist ?o ?d) (GoalProb ?l ?p))
    :outputs ()
    :certified (GE ?o ?d ?l ?p)
  )
  (:stream prob-after-move
    :inputs (?o ?d1 ?l1 ?l2)
    :domain (and (Dist ?o ?d1) (Location ?l1) (Location ?l2))
    :outputs (?d2)
    :certified (and (Dist ?o ?d2) (MoveProb ?o ?d1 ?l1 ?l2 ?d2))
  )
  (:stream prob-after-look
    :inputs (?o ?d1 ?l ?ob)
    :domain (and (Dist ?o ?d1) (Location ?l) (Obs ?ob))
    :outputs (?d2)
    :certified (and (Dist ?o ?d2) (LookProb ?o ?d1 ?l ?ob ?d2))
  )
)