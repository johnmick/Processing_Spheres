import ddf.minim.*;
import ddf.minim.signals.*;

int screenWidth = 1024, screenHeight = 576;

Minim minim;
AudioOutput out;
ArrayList spheres;
Menu menu;

void setup() {
	//size(screenWidth, screenHeight, P3D);
	size(screenWidth, screenHeight);
	minim = new Minim(this);
	out = minim.getLineOut(Minim.MONO);
	spheres = new ArrayList();
	menu = new Menu(screenWidth, screenHeight, 30);
}

void draw() {
	update();

	background(0);
	fill(0,0,0,0);

	for (int i = spheres.size()-1; i >= 0; i--) { 
		Sphere sphere = (Sphere) spheres.get(i);
		for (int k = spheres.size()-1; k >= 0; k--) {
			if (k != i) {
				if (sphere.collidesWith((Sphere)spheres.get(k))) {
					sphere.growing = !sphere.growing; 
					sphere.startSinging = true;
					sphere.singing = true;
					sphere.setFreq(sphere.r + 250);
					break;
				}
			} 
		}
		if (sphere.growing) {sphere.grow();} else {sphere.shrink();}
		if (sphere.singing) {
			if (sphere.startSinging) {
				sphere.getLouder(); 
			} else {
				sphere.getQuiet(); 
			}
			sphere.sing();
		}
		sphere.display();
	}  

	menu.draw();
}

void update() {

}

void mousePressed() {
	spheres.add(new Sphere(mouseX, mouseY, (int)random(0,201), out));
}

void stop()
{
	out.close();
	minim.stop();
	super.stop();
}
