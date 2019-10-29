// Agent pr in project sma_suprimentos

/* Initial beliefs and rules */

plays(initiator, c).

/* Initial goals */


/* Plans */

+plays(initiator, In) : .my_name(Me)
	<- .send(In, tell, introduction(participant, Me)).
	
+cfp(CNPId, Task)[source(A)] : plays(initiator, A)
	<- .send(A, tell, refuse(CNPId)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
