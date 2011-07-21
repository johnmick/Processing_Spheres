class Menu {
	int width, height, x, y;
	color bgColor = color(30, 30, 30, 255);

	Menu(int screenWidth, int screenHeight, int menuHeight) {
		this.width = screenWidth;
		this.height = menuHeight;
		this.x = 0;
		this.y = screenHeight - menuHeight;
	}


	void draw() {
		fill(bgColor);
		stroke(bgColor);
		rect(x,y,width,height);
	}
}
