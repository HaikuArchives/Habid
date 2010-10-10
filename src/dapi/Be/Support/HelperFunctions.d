module Be.Support.HelperFunctions;

import Be.Support.SupportDefs;
/*
uint32 MakeValue(byte a, byte b, byte c, byte d) {
	return (a << 24) | (b << 16) | (c << 8) | d;
}
*/
template MakeValue(char [4] val) {
	const int32 MakeValue = (val[0] << 24) | (val[1] << 16) | (val[2] << 8) | val[3];	
}

char [] getValueString(int32 value) {
	char [] bytes;
	bytes ~= (value >> 24) & 0xff;
	bytes ~= (value >> 16) & 0xff;
	bytes ~= (value >> 8) & 0xff;
	bytes ~= (value & 0xff);
	bytes ~= '\0';
	return bytes;
}

/*
uint32 MakeValue(char [4] val) {
	return (val[0] << 24) | (val[1] << 16) | (val[2] << 8) | val[3];
}
*/
