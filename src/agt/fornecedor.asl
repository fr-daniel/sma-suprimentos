// Agent c in project sma_suprimentos

/* Initial beliefs and rules */

price(Task, X) :- .random(R) & X = (10 * R) + 100.

/* Initial goals */

plays(initiator, c).

/* Plans */

+plays(initiator, In) : .my_name(Me)
	<- .send(In, tell, introduction(participant, Me)).
	
@c1 +cfp(CNPId, Task)[source(A)] : plays(initiator, A) & price(Task, Offer)
	<- +proposal(CNPId, Task, Offer);
		.send(A, tell, propose(CNPId, Offer)). 
		
@r1 +accept_proposal(CNPId) : proposal(CNPId, Task, Offer)
	<- .print("Minha proposta ", Offer, " ganhou CNP ", CNPId, " para ", Task, "!").

@r2 +reject_proposal(CNPId) 
	<- .print("I lost CNP ", CNPId, ".");
		-proposal(CNPId,_,_). 
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
