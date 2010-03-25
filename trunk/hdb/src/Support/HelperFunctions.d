module Support.HelperFunctions;

import Support.SupportDefs;

uint32 MakeValue(byte a, byte b, byte c, byte d) {
	return (a << 24) | (b << 16) | (c << 8) | d;
}
