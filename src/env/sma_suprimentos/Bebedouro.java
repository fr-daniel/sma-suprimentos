// CArtAgO artifact code for project sma_suprimentos

package sma_suprimentos;

import cartago.*;

public class Bebedouro extends Artifact {
	
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
	}

	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
	
}

