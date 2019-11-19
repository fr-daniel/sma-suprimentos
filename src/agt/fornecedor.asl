// Agent c in project sma_suprimentos

/* Initial beliefs and rules */

price(Suprimento, Qtd, Total) :- oferta(Suprimento, Valor) & Total = Valor * Qtd.

/* Initial goals */

!start.

/* Plans */

+!start <-
	?setup(Deposito).

+?setup(Light)	: .my_name(Me) 
	<-	.concat("Deposito", Me, DepositoId);
		+deposito(DepositoId);
		makeArtifact(DepositoId, "sma_suprimentos.FornecedorDeposito", [], Deposito);
		focus(Deposito);
		loadOfertas(Me)[artifact_name(DepositoId)];
		+plays(initiator, comprador).
	
-?setup(Tv) : deposito(DepositoId) <-
	lookupArtifact(DepositoId, Deposito).

/* Plans */

+plays(initiator, In) : .my_name(Me)
	<- .send(In, tell, introduction(participant, Me)).
	
+oferta(Suprimento, Valor)[artifact_name(Deposito, DepositoId)]: true 
	<- 	+oferta(Suprimento, Valor);
		.print("Novo produto: ", Suprimento, ", valor ", Valor, " R$.").
	
@c1 
+cfp(CNPId, Suprimento, Qtd)[source(A)] : plays(initiator, A) & price(Suprimento, Qtd, Total)
	<-	+proposal(CNPId, Suprimento, Total);
		.send(A, tell, propose(CNPId, Total)). 

@c2	
+cfp(CNPId, Suprimento, Qtd)[source(A)] : true
   <- .send(A, tell, refuse(CNPId)).
		
@r1 
+accept_proposal(CNPId) : proposal(CNPId, Suprimento, Total)
	<-	.print("Minha proposta ", Total, " R$ ganhou CNP ", CNPId, " para venda de ", Suprimento, "!").

@r2 
+reject_proposal(CNPId) 
	<- 	.print("Eu perdi CNP ", CNPId, ".");
		-proposal(CNPId,_,_). 
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
