//custom person for storage of custom variables
class CustomPerson{
	int 		id; 
	int 		age; 
 	PVector 	centroid;  
	PVector 	velocity; 
	tsps.Rectangle 	boundingRect;
	ArrayList contours;
	boolean 	dead;
	
	//custom vars
	PImage 		backgroundImage;
	PImage 		centroidImage;
	boolean		backgroundLoaded = false;
	PFont		timesBold18;
	PImage		idAgeImage;
	PImage 		hBoundary1;
	PImage 		hBoundary2;
	PImage 		vBoundary1;
	PImage 		vBoundary2;	
	float activeWidth, activeHeight;
	
	int[] mask1;
	int[] mask2;
	int[] mask3;
	int[] mask4;
	
	CustomPerson( TSPSPerson p, float _activeWidth, float _activeHeight )
	{
		activeWidth = _activeWidth;
		activeHeight = _activeHeight;
		id = p.id;
		contours = new ArrayList();
		
		timesBold18 = loadFont("TimesNewRomanPS-BoldItalicMT-18.vlw");
		textFont(timesBold18, 18);
		centroidImage = loadImage("CenterPoint.png");
		idAgeImage	  = loadImage("idAge.png");
		
		//load images + set up masks for bounding boxes
		hBoundary1 = loadImage("boundaries/HorizBoundry1.png");	
		hBoundary2 = loadImage("boundaries/HorizBoundry2.png");
		vBoundary1 = loadImage("boundaries/VertBoundry1.png");
		vBoundary2 = loadImage("boundaries/VertBoundry2.png");
		mask1		= new int[hBoundary1.width*hBoundary1.height];
		mask2		= new int[hBoundary2.width*hBoundary2.height];
		mask3		= new int[vBoundary1.width*vBoundary1.height];
		mask4		= new int[vBoundary2.width*vBoundary2.height];
				
		//update all vars
		update(p);
	}
	
	void loadBackground( String image )
	{
		backgroundImage = loadImage(image);
		backgroundLoaded = true;
	}
	
	void update (TSPSPerson p)
	{
		age = p.age;
		boundingRect = p.boundingRect;
		centroid = p.centroid;
		velocity = p.velocity;
		contours = p.contours;
		dead = p.dead;
				
		//update + setmasks
		
		for (int x=0; x<hBoundary1.width; x++){
			for (int y =0; y<hBoundary1.height; y++){
				if (x <=boundingRect.width*activeWidth){
					mask1[x+y*hBoundary1.height] = 255;
					mask2[x+y*hBoundary1.height] = 255;					
				} else {
					mask1[x+y*hBoundary1.height] = 0;
					mask2[x+y*hBoundary1.height] = 0;					
				}
			}
		}						
		for (int y =0; y<vBoundary1.height; y++){
			for (int x=0; x<vBoundary1.width; x++){
				if (y <=boundingRect.height*activeHeight){
					mask3[y+x*vBoundary1.width] = 255;
					mask4[y+x*vBoundary1.width] = 255;
				} else {
					mask3[y+x*vBoundary1.width] = 0;
					mask4[y+x*vBoundary1.width] = 0;
				}
			}
		}
		hBoundary1.mask(mask1);
		hBoundary2.mask(mask2);
		vBoundary1.mask(mask3);
		vBoundary2.mask(mask4);
	}
	
	void draw()
	{
                //subtract age to delete eventually
                age--;
                if (age < -2) dead = true;
		tint(255,175);
		if (backgroundLoaded) image(backgroundImage, boundingRect.x*activeWidth, boundingRect.y*activeHeight, boundingRect.width*activeWidth, boundingRect.height*activeHeight);
		tint(255);
		image (hBoundary1, boundingRect.x*activeWidth, boundingRect.y*activeHeight);
		image (hBoundary2, boundingRect.x*activeWidth, boundingRect.y*activeHeight+ boundingRect.height*activeHeight);
		image (vBoundary1, boundingRect.x*activeWidth, boundingRect.y*activeHeight-1);
		image (vBoundary2, boundingRect.x*activeWidth + boundingRect.width*activeWidth, boundingRect.y*activeHeight );
		
		imageMode(CENTER);
		image(centroidImage, centroid.x*activeWidth, centroid.y*activeHeight);
		imageMode(CORNER);
		
		image (idAgeImage, boundingRect.x*activeWidth+5, boundingRect.y*activeHeight+5);
		fill(255);
		text(Integer.toString(id), boundingRect.x*activeWidth+22, boundingRect.y*activeHeight+19);
		text(Integer.toString(age),boundingRect.x*activeWidth+82, boundingRect.y*activeHeight+19 );
		
		noFill();
		stroke(255,100);
		beginShape();
		for (int i=0; i<contours.size(); i++){
			PVector pt = (PVector) contours.get(i);
			vertex(pt.x*activeWidth, pt.y*activeHeight);
		}
		endShape(CLOSE);
		fill(255);
	}
}
