// CArtAgO artifact code for project sma_suprimentos

package sma_suprimentos;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import cartago.*;

public class Email extends Artifact {

	private List<String> suprimentosBuy = new ArrayList<String>();

	void init() {
		execInternalOp("run");
	}

	@OPERATION
	void sendEmail(String id) {
		// TODO: Enviar email suprimento ID com estoque baixo
		suprimentosBuy.add(id);
	}

	@INTERNAL_OPERATION
	void run() {
		Random random = new Random();
		while (true) {
			await_time(1000);
			if (suprimentosBuy.size() >= 1) {
				int index = random.nextInt(suprimentosBuy.size());
				signal("buy", suprimentosBuy.get(index));
				suprimentosBuy.remove(index);
				await_time(random.nextInt(7000));
			}
		}
	}

}
