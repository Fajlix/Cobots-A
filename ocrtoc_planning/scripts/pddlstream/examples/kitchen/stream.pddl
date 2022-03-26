; everything written here, should have a corresponding function!
(define (stream kitchen2d)
	;(:predicate (Collision ?control ?gripper ?pose)
	;    (and (IsControl ?control) (IsPose ?gripper ?pose))
	;)

	(:stream sample-motion
		:inputs (?gripper ?pose ?pose2)
		:domain (and (IsGripper ?gripper) (IsPose ?gripper ?pose) (IsPose ?gripper ?pose2))
		:outputs (?control)
		:certified (and (Motion ?gripper ?pose ?pose2 ?control) (IsControl ?control))
	)
	(:stream sample-push
		:inputs (?gripper ?block ?pose3 ?pose4)
		:domain (and (IsGripper ?gripper) (IsBlock ?block)
					 (IsPose ?block ?pose3) (IsPose ?block ?pose4))
		:outputs (?pose ?pose2 ?control)
		:certified (and (CanPush ?gripper ?pose ?pose2 ?block ?pose3 ?pose4 ?control)
						(IsPose ?gripper ?pose) (IsPose ?gripper ?pose2))
	)
	;(:stream sample-motion-h
	;	:inputs (?gripper ?pose ?cup ?grasp ?pose2)
	;	:domain (and (IsGripper ?gripper) (IsPose ?gripper ?pose)
	;				 (IsGrasp ?cup ?grasp) (IsPose ?gripper ?pose2))
	;	:outputs (?control)
	;	:certified (and (MotionH ?gripper ?pose ?cup ?grasp ?pose2 ?control)
	;	                (IsControl ?control))
	;)
	(:stream sample-pour
		:inputs (?gripper ?cup ?kettle ?pose2)
		:domain (and (IsGripper ?gripper) (IsPourable ?cup)
					 (IsCup ?kettle) (IsPose ?kettle ?pose2))
		:outputs (?grasp ?pose ?control)
		:certified (and (CanPour ?gripper ?pose ?cup ?grasp ?kettle ?pose2 ?control)
						(IsPose ?gripper ?pose) (IsGrasp ?cup ?grasp))
	)
	(:stream sample-stack
		:inputs (?cup ?block ?pose2)
		:domain (and (Stackable ?cup ?block) (IsPose ?block ?pose2))
		:outputs (?pose)
		:certified (and (BlockSupport ?cup ?pose ?block ?pose2)
						(IsPose ?cup ?pose))
	)
	(:stream sample-grasp-ctrl
		:inputs (?gripper ?cup ?pose2 ?grasp)
		:domain (and (IsGripper ?gripper) (IsPose ?cup ?pose2)
					 (IsGrasp ?cup ?grasp))
		:outputs (?pose ?control)
		:certified (and (CanGrasp ?gripper ?pose ?cup ?pose2 ?grasp ?control)
						(IsPose ?gripper ?pose) (IsControl ?control))
	)
	(:stream sample-grasp-stirrer
		:inputs (?spoon)
		:domain (IsStirrer ?spoon)
		:outputs (?grasp)
		:certified (IsGrasp ?spoon ?grasp)
	)
	(:stream sample-grasp-cup
		:inputs (?cup)
		:domain (IsCup ?cup)
		:outputs (?grasp)
		:certified (IsGrasp ?cup ?grasp)
	)
	(:stream sample-fill
		:inputs (?gripper ?cup ?grasp)
		:domain (and (IsGripper ?gripper) (IsCup ?cup)
					 (IsGrasp ?cup ?grasp))
		:outputs (?pose)
		:certified (and (BelowFaucet ?gripper ?pose ?cup ?grasp)
						(IsPose ?gripper ?pose))
	)
	(:stream sample-scoop
		:inputs (?gripper ?spoon ?kettle ?pose3)
		:domain (and (IsGripper ?gripper) (IsSpoon ?spoon)
					 (IsCup ?kettle) (IsPose ?kettle ?pose3))
		:outputs (?pose ?pose2 ?grasp ?control)
		:certified (and (CanScoop ?gripper ?pose ?pose2 ?spoon ?grasp ?kettle ?pose3 ?control)
						(IsPose ?gripper ?pose) (IsPose ?gripper ?pose2)
						(IsGrasp ?spoon ?grasp))
	)
	(:stream sample-dump
		:inputs (?gripper ?spoon ?grasp ?kettle ?pose2)
		:domain (and (IsGripper ?gripper) (IsSpoon ?spoon)
					 (IsGrasp ?spoon ?grasp) (IsCup ?kettle)
					 (IsPose ?kettle ?pose2))
		:outputs (?pose ?pose3 ?control)
		:certified (and (CanDump ?gripper ?pose ?pose3 ?spoon ?grasp ?kettle ?pose2 ?control)
						(IsPose	?gripper ?pose) (IsPose ?gripper ?pose3))
	)
	(:stream sample-stir
		:inputs (?gripper ?spoon ?grasp ?kettle ?pose2)
		:domain (and (IsGripper ?gripper) (IsStirrer ?spoon)
					 (IsGrasp ?spoon ?grasp) (IsCup ?kettle) (IsPose ?kettle ?pose2))
		:outputs (?pose ?control)
		:certified (and (CanStir ?gripper ?pose ?spoon ?grasp ?kettle ?pose2 ?control)
						(IsPose ?gripper ?pose))
	)
)
