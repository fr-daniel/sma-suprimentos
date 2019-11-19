// Agent water_agent in project sma_suprimentos

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true 
	<-	makeArtifact("Bebedouro", "sma_suprimentos.Bebedouro", [], Bebedouro);
		focus(Bebedouro);
		start[artifact_id(Estoque)].
		
+volumeAgua(V) : volumeMinimo(M) & V < M
	<- 	println("Alerta volume baixo ");
		.wait(2000);
		!notifyManager(S, E, M).

+!notifyManager(S, E, M)
	<-	println("Enviado mensagem para gerente...");.
//		.send(manager_agent, tell, lowStock(S, E, M)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
