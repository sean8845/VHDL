ENTITY Class0510 IS
PORT(
	A: IN BIT_VECTOR(1 downto 0);
	C: IN BIT;
	X: OUT BIT;
	Y: OUT BIT);
END Class0510;

ARCHITECTURE and_or OF Class0510 IS
BEGIN
	X <= A(1) and A(0) and (not C);
	Y <= (A(1) or A(0)) and (not C);
END and_or;
	