class Sphere {
	float x;
	float y;
	float z;
	float r;
	float amp;
	boolean growing;
	boolean startSinging;
	boolean singing;
	Oscillator sine;
	int rd, gr, bl, srd, sgr, sbl;

	Sphere(int _x, int _y, int _z, AudioOutput out) {
		x = _x;
		y = _y;
		z = _z;
		r = 1;
		amp = 0;
		setColor();
		growing = true;
		singing = false;
		sine = new SineWave(440, amp, 44100);
		out.addSignal(sine);
	}

	void display() {
		fill(rd,gr,bl,255);
		stroke(srd, sgr, sbl, 200);
		ellipse(x,y,r,r); 
		//pushMatrix();
		//translate(x,y,z);
		//sphere(r);
		//popMatrix();
	}

	void grow() { 
		r += 1;
	}

	void shrink() {
		if ( r > 0 ) {
			r -= 1; 
		} else {
			growing = true; 
			setColor();
		}
	}

	void setFreq(float freq) {
		sine.setFreq(freq); 
	}

	void getLouder() {
		if (amp < .05) {
			amp += .003;
		} else {
			amp = .05;
			startSinging = false; 
		}
	}

	void getQuiet() {
		if (amp > 0.0 ) {
			amp -= 0.005; 
		} else {
			amp = 0;
		}
	}

	void sing() {
		sine.setAmp(amp);
		if (amp == 0) {
			singing=false;
		} 
	}

	boolean collidesWith(Sphere ball2) {
		//float d = sqrt(sq(ball2.x - this.x) + sq(ball2.y - this.y) + sq(ball2.z - this.z));
		float d = sqrt(sq(ball2.x - this.x) + sq(ball2.y - this.y));
		//if (d < (this.r + ball2.r)) {
		if (d*2 < (this.r + ball2.r)) {
			return true; 
		} else {
			return false;
		}
	}

	void setColor() {
		rd = (int)random(51,251);
		gr = (int)random(51,251);
		bl = (int)random(51,251);
		srd = rd - 50;
		sgr = gr - 50;
		sbl = bl - 50;
	}
}
