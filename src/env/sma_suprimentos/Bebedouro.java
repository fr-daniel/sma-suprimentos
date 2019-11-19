// CArtAgO artifact code for project sma_suprimentos

package sma_suprimentos;

import java.util.Random;

import cartago.*;

public class Bebedouro extends Artifact {

	void init() {
		defineObsProperty("capacidade", 1000);
		defineObsProperty("volumeAgua", 1000);
		defineObsProperty("volumeMinimo", 300);
	}

	@OPERATION
	void start() {
		execInternalOp("run");
	}

	@OPERATION
	void addAgua(Integer volume) {
		ObsProperty volumeAgua = getObsProperty("volumeAgua");
		ObsProperty capacidade = getObsProperty("volumeAgua");
		if (capacidade.intValue() > (volume + volumeAgua.intValue())) {
			volumeAgua.updateValue(volumeAgua.intValue() + volume);
		} else {
			volumeAgua.updateValue(capacidade.intValue());
		}
	}

	@INTERNAL_OPERATION
	void run() {
		Random random = new Random();
		while (true) {
			await_time(10000);
			if (4 > random.nextInt(10)) {
				ObsProperty volumeAgua = getObsProperty("volumeAgua");
				if (volumeAgua.intValue() > 100) {
					volumeAgua.updateValue(volumeAgua.intValue() - 100);
				}
			}
		}
	}

}
