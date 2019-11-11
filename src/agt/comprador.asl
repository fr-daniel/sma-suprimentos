// Agent p in project sma_suprimentos

/* Initial beliefs and rules */

all_proposals_received(CNPId) :- .count(introduction(participant, _), NP) &
	.count(propose(CNPId, _), NO) &
	.count(refuse(CNPId, _), NR) & 
	NP = NO + NR.

/* Initial goals */

/* Plans */

+!startCNP(Id, Object) 	
	<-	.wait(2000);
		+cnp_state(Id, propose);
		.findall(Name, introduction(participant, Name), LP);
		.print("Enviando CFP para ", LP);
		.send(LP, tell, cfp(Id, Object));
		.concat("+!contract(", Id ,")", Event).
//		.at("agora +4 segundos", Event).

@r1 +propose(CNPId, Offer) : cnp_state(CNPId, propose) & all_proposals_received(CNPId)
	<-	!contract(CNPId).	

@r2 +refuse(CNPId) : cnp_state(CNPId, propose) & all_proposals_received(CNPId)
	<- !contract(CNPId).
	
@lc1[atomic] +!contract(CNPId) : cnp_state(CNPId, propose)
	<- 	-+cnp_state(CNPId, contract);
		.findall(offer(O,A), propose(CNPId, O)[source(A)], L);
		.print("As ofertas são", L);
		L \== [];
		.min(L, offer(WOf, WAg));
		.print("Ganhador é ", WAg, " com ", WOf);
		!announce_result(CNPId, L, WAg);
		-+cnp_state(Id, finished).
		
@lc2 +!contract(CNPId).

-!contract(CNPId) 
	<- .print("CNP ", CNPId ," foi finalizada!").

+!announce_result(_,[],_).

+!announce_result(CNPId, [offer(O, WAg) | T], WAg)
	<- .send(WAg, tell, accept_proposal(CNPId));
		!announce_result(CNPId, T, WAg).

+!announce_result(CNPId,[offer(O, LAg) | T], WAg)
	<- .send(LAg, tell, reject_proposal(CNPId));
		!announce_result(CNPId,T,WAg).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
