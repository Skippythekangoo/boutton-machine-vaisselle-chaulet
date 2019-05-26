// Disque de base
module disquebase()
{
	difference()
	{
		translate([0,0,2.635]) cylinder(r=16.415, h=5.27, $fn=256, center=true);
	}
}

// Demi-disque
module demidisque()
{
	difference()
	{
		translate([0,0,2.635]) rotate([0,90,0]) cylinder(r=16.415, h=5.27, $fn=256, center=true);
		translate([0,0,-10]) cube([20,40,20], center=true);
	}
}

module cache()
{
	cube([2,9,7], center=true);
}


module base()
{
	disquebase();
	demidisque();
	translate([3,0,8.5])  cache();
	translate([-3,0,8.5])  cache();
}

module troucarre()
{
union()
{
		// Trou carré
		translate([0,0,5]) cube([6.13,6.13,13], center=true);
		//translate([3.05,3.05,0]) rotate([0,0,45]) cube([2,2,13], center=true);
}
}


module repere()
{	
	cube([1,1,5.27], center=true);
}

union()
{
	difference()
	{
		base();
		troucarre();
	}

	translate([0,16.915,2.635]) repere();
}
