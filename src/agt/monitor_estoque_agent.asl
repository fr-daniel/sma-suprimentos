// Agent monitor_estoque_agent in project sma_suprimentos

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true 
	<-	makeArtifact("Estoque", "sma_suprimentos.Estoque", [], Estoque);
		focus(Estoque);
		.wait(4000)
		loadSuprimentos[artifact_id(Estoque)].
		
+suprimento(S, E, M) : E <= M
	<- 	println("Alerta: ", S, " está com o estoque abaixo da quantidade mínima.");
		.wait(2000);
		!notifyManager(S, E, M).
	
+suprimento(S, _, _)   
	<- println("Monitorando quantidade de ", S, ".").

+!notifyManager(S, E, M)
	<-	println("Enviado mensagem para gerente...");
		.send(manager_agent, tell, lowStock(S, E, M));
		.wait(4000).
		
//+delivered(beer, Qtd, OrderId)[source(supermarket)] : true
//	<-	+available(beer, fridge);
//		!has(owner, beer).
				
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
