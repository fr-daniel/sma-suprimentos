// Agent pn in project sma_suprimentos

/* Initial beliefs and rules */

plays(initiator, c).

/* Initial goals */


/* Plans */

+plays(initiator, In) : 
	.my_name(Me)
	<- .send(In, tell, introduction(participant, Me)).
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
