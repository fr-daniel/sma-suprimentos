// Agent gerente in project sma_suprimentos

/* Initial beliefs and rules */

last_permission_id(0).

/* Initial goals */

!start.

/* Plans */

+!start 
	<-	makeArtifact("Email", "sma_suprimentos.Email", [], Email);
		focus(Email).
		
+lowStock(S, _, _)
	<- 	println("Gerando pedidio de permissão para comprar do suprimento ", S ,".");
		?last_permission_id(N);
		PermissionId = N + 1;
		-+last_permission_id(PermissionId);
		.wait(3000);
		-lowStock(S, _, _);
		!askForPermission(PermissionId, S).

+!askForPermission(PermissionId, S) 
	<- 	println("Pedido de permissão (", PermissionId, ", ", S ,") gerado. ", "Enviando mensagem ao usuário...");
		.term2string(PermissionId, Id)
		.wait(2000);
		sendEmail(Id)[artifact_id(Email)];
		+permission(PermissionId, S);
		println("Aguardando aprovação para comprar do suprimento ", S, ".").

+?last_permission_id(N) 
	<- 	last_permission_id(P);
	 	N = P.

+buy(Id) 
	<- .print("Recebi autorização para compra do suprimento: ", Id)
	.send(comprador, achieve, startCNP(Id, buy(arroz))).

	 	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
