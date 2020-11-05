$fn = 60;
length = 10;
width = 40;
thickness = 3;
innerdiameter = 10;
outerdiameter = innerdiameter+2*thickness;
pocketdepth = 2;

holediameter = 3;
holeposition = width/2-(width/2-innerdiameter/2-thickness)/2;

module hole (pos, rot){
		translate(pos) rotate(rot)
		{
			cylinder(d=holediameter, h=2*thickness, center=true);
			translate([0, 0, -pocketdepth/2])
				cylinder(d=2.2*holediameter, h=thickness, center=true);
		}
}

difference()
{
	union()
	{
		cylinder(h=length, d=outerdiameter, center=true);
		translate([0, -outerdiameter/4, 0])
			cube([outerdiameter, outerdiameter/2, length], center=true);

		translate([0, -innerdiameter/2+thickness/2, 0])
			cube([width, thickness, length], center=true);
	}


	// color("red")
	{
		cylinder(h=length*2, d=innerdiameter, center=true);
		translate([0, -innerdiameter/2, 0])
			cube([innerdiameter, innerdiameter, length*2], center=true);

		translate([0, -innerdiameter/2-thickness, 0])
			cube([width, 2*thickness, 2*length], center=true);

		// holes
		hole([holeposition,-innerdiameter/2+thickness/2, 0], [90, 0, 0]);
		hole([-holeposition,-innerdiameter/2+thickness/2, 0], [90, 0, 0]);
	}
}

