// Gmsh project created on Fri Jun 14 10:02:26 2019
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0, 1, 0, 1.0};
//+
Point(3) = {1, 0, 0, 1.0};
//+
Point(4) = {-1, 0, 0, 1.0};
//+
Point(5) = {-0.0001, -1., 0, 1.0};
//+
Point(6) = {0.0001, -1., 0, 1.0};
//+
Point(7) = {0, 0.75, 0, 1.0};
//+
Point(8) = {0, -0.75, 0, 1.0};
//+
Point(9) = {-0.75, 0, 0, 1.0};
//+
Point(10) = {0.75, 0, 0, 1.0};
//+
Point(11) = {0.5, 0, 0, 1.0};
//+
Point(12) = {-0.5, 0, 0, 1.0};
//+
Point(13) = {0, 0.5, 0, 1.0};
//+
Point(14) = {0, -0.5, 0, 1.0};
//+
Circle(1) = {2, 1, 4};
//+
Circle(2) = {4, 1, 5};
//+
Circle(4) = {6, 1, 3};
//+
Circle(5) = {3, 1, 2};
//+
Circle(6) = {7, 1, 9};
//+
Circle(7) = {9, 1, 8};
//+
Circle(8) = {8, 1, 10};
//+
Circle(9) = {10, 1, 7};
//+
Line(10) = {5, 8};
//+
Line(11) = {8, 6};
//+
Line(12) = {2, 7};
//+
Circle(13) = {13, 1, 12};
//+
Circle(14) = {12, 1, 14};
//+
Circle(15) = {14, 1, 11};
//+
Circle(16) = {11, 1, 13};
//+
Line(17) = {7, 13};
//+
Line(18) = {8, 14};
//+
Line(19) = {10,11};
//+
Line(20) = {3,10};
//+
Line(21) = {4,9};
//+
Line(22) = {9,12};
//+
Curve Loop(1) = {1, 21, -6, -12};
//+
Curve Loop(2) = {2, 10, -7, -21};
//+
Curve Loop(3) = {4, 20, -8, 11};
//+
Curve Loop(4) = {5, 12, -9, -20};
//+
Curve Loop(5) = {6, 22, -13, -17};
//+
Curve Loop(6) = {7, 18, -14, -22};
//+
Curve Loop(7) = {8, 19, -15, -18};
//+
Curve Loop(8) = {9, 17, -16, -19};
//+
Plane Surface(1) = {1};
//+
Plane Surface(2) = {2};
//+
Plane Surface(3) = {3};
//+
Plane Surface(4) = {4};
//+
Plane Surface(5) = {5};
//+
Plane Surface(6) = {6};
//+
Plane Surface(7) = {7};
//+
Plane Surface(8) = {8};
//+
Physical Curve("IN", 1) = {13:16};
//+
Physical Curve("OUT", 2) = {1,2,4,5};
//+
Physical Curve("LIM", 3) = {10:11};
//+
Physical Surface("DOM", 4) = {1:8};
//+
// -----------------------------------------------------------------------------
// Transfinite and Structured Meshing
// -----------------------------------------------------------------------------

// Define the number of mesh points along curves
N_arc_top = 30;
N_arc_bottom = 30;
N_rad_in = 12;
N_rad_out = 12;

// Apply transfinite constraints to curves
// The number of points must be the same on opposing curves of a surface
Transfinite Curve {1, 6, 13, 5, 9, 16} = N_arc_top + 1;
Transfinite Curve {2, 4, 7, 8, 14, 15} = N_arc_bottom + 1;
Transfinite Curve {10, 11, 12, 20, 21} = N_rad_out + 1;
Transfinite Curve {17, 18, 19, 22} = N_rad_in + 1;


// Apply transfinite constraints to surfaces and define corners
Transfinite Surface {1} = {2, 4, 9, 7};
Transfinite Surface {2} = {4, 5, 8, 9};
Transfinite Surface {3} = {6, 3, 10, 8};
Transfinite Surface {4} = {3, 2, 7, 10};
Transfinite Surface {5} = {7, 9, 12, 13};
Transfinite Surface {6} = {9, 8, 14, 12};
Transfinite Surface {7} = {8, 10, 11, 14};
Transfinite Surface {8} = {10, 7, 13, 11};

Mesh.ElementOrder = 4;                  // Essential: enable quadratic (curved) elements
Mesh.SecondOrderLinear = 0;
Mesh.HighOrderOptimize = 2;             // Optimize interior node positions
Mesh.MshFileVersion = 2.2;              // Optional: Ensures compatibility for visualization
