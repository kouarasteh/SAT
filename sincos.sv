//-------------------------------------------------------------------------
//    sincos.sv                                                       --
//    Written by Kourosh Arasteh  05-03-2017                             --
//                                                                       --
//-------------------------------------------------------------------------

module sincos ( input              Clk,
                input      integer thetaout ,
                output integer sin,
					 output integer cos);

 // This module will be synthesized into a RAM ASSUMING RADIUS 10
    always_ff @ (posedge Clk)
    case (thetaout)
    0: 
	 begin
	 sin <= 0; cos <= 10;   
	 end
	 1: 
	 begin
	 sin <= 0; cos <= 10;
	 end
	 2: 
	 begin
	 sin <= 0; cos <= 10; 
	 end
	 3: 
	 begin
	 sin <= 1; cos <= 10;
    end
	 4: 
	 begin
	 sin <= 1; cos <= 10;   
	 end
	 5:
	 begin
	 sin <= 1; cos <= 10; 
	 end
	 6: 
	 begin
	 sin <= 1; cos <= 10; 
	 end
	 7: 
	 begin
	 sin <= 1; cos <= 10;
	 end
	 8:
	 begin
	 sin <= 1; cos <= 10;   
	 end
	 9:
	 begin
	 sin <= 2; cos <= 10; 
	 end
	 10:
	 begin
	 sin <= 2; cos <= 10; 
	 end
	 11:
	 begin
	 sin <= 2; cos <= 10;
	 end
	 12:
	 begin
	 sin <= 2; cos <= 10;  
	 end
	 13:
	 begin
	 sin <= 2; cos <= 10; 
	 end
	 14:
	 begin
	 sin <= 2; cos <= 10; 
	 end
	 15:
	 begin
	 sin <= 3; cos <= 10;
	 end
	 16: 
	 begin
	 sin <= 3; cos <= 10;  
	 end
	 17:
	 begin
	 sin <= 3; cos <= 10; 
	 end
	 18:
	 begin
	 sin <= 3; cos <= 10; 
	 end
	 19: 
	 begin
	 sin <= 3; cos <= 9;
	 end
	 20: 
	 begin
	 sin <= 3; cos <= 9;  
	 end
	 21: 
	 begin
	 sin <= 4; cos <= 9; 
	 end
	 22:
	 begin
	 sin <= 4; cos <= 9; 
	 end
	 23:
	 begin
	 sin <= 4; cos <= 9;
	 end
	 24:
	 begin
	 sin <= 4; cos <= 9;  
	 end
	 25:
	 begin 
	 sin <= 4; cos <= 9; 
	 end
	 26:
	 begin
	 sin <= 4; cos <= 9; 
	 end
	 27:
	 begin
	 sin <= 5; cos <= 9;
	 end
	 28:
	 begin
	 sin <= 5; cos <= 9;  
	 end
	 29:
	 begin
	 sin <= 5; cos <= 9; 
	 end
	 30:
	 begin
	 sin <= 5; cos <= 9; 
	 end
	 31: 
	 begin
	 sin <= 5; cos <= 9;
	 end
	 32:
	 begin
	 sin <= 5; cos <= 8;  
	 end
	 33: 
	 begin
	 sin <= 5; cos <= 8; 
	 end
	 34: 
	 begin
	 sin <= 5; cos <= 8; 
	 end
	 35: 
	 begin
	 sin <= 6; cos <= 8;
	 end
	 36: 
	 begin
	 sin <= 6; cos <= 8;  
	 end
	 37: 
	 begin
	 sin <= 6; cos <= 8; 
	 end
	 38: 
	 begin
	 sin <= 6; cos <= 8; 
	 end
	 39: 
	 begin
	 sin <= 6; cos <= 8;
	 end
	 40: 
	 begin
	 sin <= 6; cos <= 8;  
	 end
	 41: 
	 begin
	 sin <= 7; cos <= 8; 
	 end
	 42: 
	 begin
	 sin <= 7; cos <= 7; 
	 end
	 43:
	 begin
	 sin <= 7; cos <= 7;
	 end
	 44: 
	 begin
	 sin <= 7; cos <= 7;  
	 end
	 45: 
	 begin
	 sin <= 7; cos <= 7; 
	 end
	 46: 
	 begin
	 sin <= 7; cos <= 7; 
	 end
	 47: 
	 begin
	 sin <= 7; cos <= 7;
	 end
	 48: 
	 begin
	 sin <= 7; cos <= 7;  
	 end
	 49: 
	 begin
	 sin <= 8; cos <= 7; 
	 end
	 50: 
	 begin
	 sin <= 8; cos <= 6; 
	 end
	 51: 
	 begin
	 sin <= 8; cos <= 6;
	 end
	 52: 
	 begin
	 sin <= 8; cos <= 6;  
	 end
	 53: 
	 begin
	 sin <= 8; cos <= 6; 
	 end
	 54: 
	 begin
	 sin <= 8; cos <= 6; 
	 end
	 55: 
	 begin
	 sin <= 8; cos <= 6;
	 end
	 56: 
	 begin
	 sin <= 8; cos <= 6;  
	 end
	 57: 
	 begin
	 sin <= 8; cos <=5; 
	 end
	 58: 
	 begin
	 sin <= 8; cos <= 5; 
	 end
	 59: 
	 begin
	 sin <= 9; cos <= 5;
	 end
	 60: 
	 begin
	 sin <= 9; cos <= 5;  
	 end
	 61: 
	 begin
	 sin <= 9; cos <= 5; 
	 end
	 62: 
	 begin
	 sin <= 9; cos <= 5; 
	 end
	 63: 
	 begin
	 sin <= 9; cos <= 5;
	 end
	 64: 
	 begin
	 sin <= 9; cos <= 4;  
	 end
	 65: 
	 begin
	 sin <= 9; cos <= 4; 
	 end
	 66: 
	 begin
	 sin <= 9; cos <= 4; 
	 end
	 67: 
	 begin
	 sin <= 9; cos <= 4;
	 end
	 68: 
	 begin
	 sin <= 9; cos <= 4;  
	 end
	 69: 
	 begin
	 sin <= 9; cos <= 4; 
	 end
	 70: 
	 begin
	 sin <= 9; cos <= 3; 
	 end
	 71: 
	 begin
	 sin <= 9; cos <= 3;
	 end
	 72: 
	 begin
	 sin <= 10; cos <= 3;  
	 end
	 73: 
	 begin
	 sin <= 10; cos <= 3; 
	 end
	 74: 
	 begin
	 sin <= 10; cos <= 3; 
	 end
	 75: 
	 begin
	 sin <= 10; cos <= 3;
	 end
	 76: 
	 begin
	 sin <= 10; cos <= 2;  
	 end
	 77: 
	 begin
	 sin <= 10; cos <= 2; 
	 end
	 78: 
	 begin
	 sin <= 10; cos <= 2; 
	 end
	 79: 
	 begin
	 sin <= 10; cos <= 2;
	 end
	 80: 
	 begin
	 sin <= 10; cos <= 2;  
	 end
	 81: 
	 begin
	 sin <= 10; cos <= 2; 
	 end
	 82: 
	 begin
	 sin <= 10; cos <= 1; 
	 end
	 83: 
	 begin
	 sin <= 10; cos <= 1;
	 end
	 84: 
	 begin
	 sin <= 10; cos <= 1;  
	 end
	 85: 
	 begin
	 sin <= 10; cos <= 1; 
	 end
	 86: 
	 begin
	 sin <= 10; cos <= 1; 
	 end
	 87: 
	 begin
	 sin <= 10; cos <= 1;
	 end
	 88: 
	 begin
	 sin <= 10; cos <= 0;  
	 end
	 89: 
	 begin
	 sin <= 10; cos <= 0; 
	 end
	 90:
	 begin
	 sin <= 10; cos <= 0; 
	 end
	 91:
	 begin
	 sin <= 10; cos <= 0;
	 end
	 92:
	 begin
	 sin <= 10; cos <= 0;  
	 end
	 93:
	 begin
	 sin <= 10; cos <= -1; 
	 end
	 94:
	 begin
	 sin <= 10; cos <= -1; 
	 end
	 95:
	 begin
	 sin <= 10; cos <= -1;
	 end
	 96:
	 begin
	 sin <= 10; cos <= -1;  
	 end
	 97:
	 begin
	 sin <= 10; cos <= -1; 
	 end
	 98: 
	 begin
	 sin <= 10; cos <= -1; 
	 end
	 99:
	 begin
	 sin <= 10; cos <= -2;
	 end
	 100:
	 begin
	 sin <= 10; cos <= -2; 
	 end
	 101:
	 begin
	 sin <= 10; cos <= -2; 
	 end
	 102: 
	 begin
	 sin <= 10; cos <= -2; 
	 end
	 103: 
	 begin
	 sin <= 10; cos <= -2;
	 end
	 104: 
	 begin
	 sin <= 10; cos <= -2; 
	 end
	 105: 
	 begin
	 sin <= 10; cos <= -3; 
	 end
	 106: 
	 begin
	 sin <= 10; cos <= -3; 
	 end
	 107: 
	 begin
	 sin <= 10; cos <= -3;
	 end
	 108: 
	 begin
	 sin <= 10; cos <= -3; 
	 end
	 109: 
	 begin
	 sin <= 9; cos <= -3; 
	 end
	 110: 
	 begin
	 sin <= 9; cos <= -3; 
	 end
	 111: 
	 begin
	 sin <= 9; cos <= -4;
	 end
	 112: 
	 begin
	 sin <= 9; cos <= -4; 
	 end
	 113: 
	 begin
	 sin <= 9; cos <= -4; 
	 end
	 114: 
	 begin
	 sin <= 9; cos <= -4; 
	 end
	 115: 
	 begin
	 sin <= 9; cos <= -4;
	 end
	 116: 
	 begin
	 sin <= 9; cos <= -4; 
	 end
	 117: 
	 begin
	 sin <= 9; cos <= -5; 
	 end
	 118: 
	 begin
	 sin <= 9; cos <= -5; 
	 end
	 119: 
	 begin
	 sin <= 9; cos <= -5;
	 end
	 120: 
	 begin	 
	 sin <= 9; cos <= -5; 
	 end
	 121: 
	 begin
	 sin <= 9; cos <= -5; 
	 end
	 122: 
	 begin
	 sin <= 8; cos <= -5; 
	 end
	 123: 
	 begin
	 sin <= 8; cos <= -5;
	 end
	 124: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 125: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 126: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 127: 
	 begin
	 sin <= 8; cos <= -6;
	 end
	 128: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 129: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 130: 
	 begin
	 sin <= 8; cos <= -6; 
	 end
	 131: 
	 begin
	 sin <= 8; cos <= -7;
	 end
	 132: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 133: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 134: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 135: 
	 begin
	 sin <= 7; cos <= -7;
	 end
	 136: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 137: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 138: 
	 begin
	 sin <= 7; cos <= -7; 
	 end
	 139: 
	 begin
	 sin <= 7; cos <= -8;
	 end
	 140: 
	 begin
	 sin <= 6; cos <= -8; 
	 end
	 141: 
	 begin
	 sin <= 6; cos <= -8; 
	 end
	 142: 
	 begin
	 sin <= 6; cos <= -8; 
	 end
	 143: 
	 begin
	 sin <= 6; cos <= -8;
	 end
	 144: 
	 begin
	 sin <= 6; cos <= -8; 
	 end
	 145: 
	 begin
	 sin <= 6; cos <= -8; 
	 end
	 146: 
	 begin
	 sin <= 5; cos <= -8; 
	 end
	 147: 
	 begin
	 sin <= 5; cos <= -8;
	 end
	 148: 
	 begin
	 sin <= 5; cos <= -8; 
	 end
	 149: 
	 begin
	 sin <= 5; cos <= -9; 
	 end
	 150: 
	 begin
	 sin <= 5; cos <= -9; 
	 end
	 151: 
	 begin
	 sin <= 5; cos <= -9;
	 end
	 152: 
	 begin
	 sin <= 5; cos <= -9;
	 end
	 153: 
	 begin
	 sin <= 5; cos <= -9; 
	 end
	 154: 
	 begin
	 sin <= 4; cos <= -9; 
	 end
	 155:
	 begin
	 sin <= 4; cos <= -9;
	 end
	 156: 
	 begin
	 sin <= 4; cos <= -9; 
	 end
	 156: 
	 begin
	 sin <= 4; cos <= -9; 
	 end
	 158: 
	 begin
	 sin <= 4; cos <= -9; 
	 end
	 159: 
	 begin
	 sin <= 4; cos <= -9;
	 end
	 160: 
	 begin
	 sin <= 3; cos <= -9; 
	 end
	 161: 
	 begin
	 sin <= 3; cos <= -9; 
	 end
	 162: 
	 begin
	 sin <= 3; cos <= -10; 
	 end
	 163: 
	 begin
	 sin <= 3; cos <= -10;
	 end
	 164: 
	 begin
	 sin <= 3; cos <= -10; 
	 end
	 165: 
	 begin
	 sin <= 3; cos <= -10; 
	 end
	 166: 
	 begin
	 sin <= 2; cos <= -10; 
	 end
	 167: 
	 begin
	 sin <= 2; cos <= -10;
	 end
	 168: 
	 begin
	 sin <= 2; cos <= -10; 
	 end
	 169: 
	 begin
	 sin <= 2; cos <= -10; 
	 end
	 170: 
	 begin
	 sin <= 2; cos <= -10; 
	 end
	 171: 
	 begin
	 sin <= 2; cos <= -10;
	 end
	 172: 
	 begin
	 sin <= 1; cos <= -10; 
	 end
	 173: 
	 begin
	 sin <= 1; cos <= -10; 
	 end
	 174: 
	 begin
	 sin <= 1; cos <= -10; 
	 end
	 175: 
	 begin
	 sin <= 1; cos <= -10;
	 end
	 176: 
	 begin
	 sin <= 1; cos <= -10; 
	 end
	 177: 
	 begin
	 sin <= 1; cos <= -10; 
	 end
	 178: 
	 begin
	 sin <= 0; cos <= -10; 
	 end
	 179: 
	 begin
	 sin <= 0; cos <= -10;
	 end
	 180: 
	 begin
	 sin <= 0; cos <= -10;
	 end
	 181: 
	 begin
	 sin <= 0; cos <= -10;
	 end
	 182: 
	 begin
	 sin <= 0; cos <= -10; 
	 end
	 183: 
	 begin
	 sin <= -1; cos <= -10;
    end
	 184: 
	 begin
	 sin <= -1; cos <= -10;   
	 end
	 185: 
	 begin
	 sin <= -1; cos <= -10; 
	 end
	 186: 
	 begin
	 sin <= -1; cos <= -10; 
	 end
	 187: 
	 begin
	 sin <= -1; cos <= -10;
	 end
	 188: 
	 begin
	 sin <= -1; cos <= -10;   
	 end
	 189: 
	 begin
	 sin <= -2; cos <= -10; 
	 end
	 190: 
	 begin
	 sin <= -2; cos <= -10; 
	 end
	 191: 
	 begin
	 sin <= -2; cos <= -10;
	 end
	 192: 
	 begin
	 sin <= -2; cos <= -10;  
	 end
	 193: 
	 begin
	 sin <= -2; cos <= -10; 
	 end
	 194: 
	 begin
	 sin <= -2; cos <= -10; 
	 end
	 195: 
	 begin
	 sin <= -3; cos <= -10;
	 end
	 196: 
	 begin
	 sin <= -3; cos <= -10;  
	 end
	 197: 
	 begin
	 sin <= -3; cos <= -10; 
	 end
	 198: 
	 begin
	 sin <= -3; cos <= -10; 
	 end
	 199: 
	 begin
	 sin <= -3; cos <= -9;
	 end
	 200: 
	 begin
	 sin <= -3; cos <= -9;  
	 end
	 201: 
	 begin
	 sin <= -4; cos <= -9; 
	 end
	 202:
	begin
	sin <= -4; cos <= -9; 
	 end
	 203: 
	 begin
	 sin <= -4; cos <= -9;
	 end
	 204: 
	 begin
	 sin <= -4; cos <= -9;  
	 end
	 205: 
	 begin
	 sin <= -4; cos <= -9; 
	 end
	 206: 
	 begin
	 sin <= -4; cos <= -9; 
	 end
	 207: 
	 begin
	 sin <= -5; cos <= -9;
	 end
	 208: 
	 begin
	 sin <= -5; cos <= -9;  
	 end
	 209: 
	 begin
	 sin <= -5; cos <= -9; 
	 end
	 210: 
	 begin
	 sin <= -5; cos <= -9; 
	 end
	 211: 
	 begin
	 sin <= -5; cos <= -9;
	 end
	 212: 
	 begin
	 sin <= -5; cos <= -8;  
	 end
	 213: 
	 begin
	 sin <= -5; cos <= -8; 
	 end
	 214: 
	 begin
	 sin <= -5; cos <= -8; 
	 end
	 215: 
	 begin
	 sin <= -6; cos <= -8;
	 end
	 216: 
	 begin
	 sin <= -6; cos <= -8;  
	 end
	 217: 
	 begin
	 sin <= -6; cos <= -8; 
	 end
	 218: 
	 begin
	 sin <= -6; cos <= -8; 
	 end
	 219: 
	 begin
	 sin <= -6; cos <= -8;
	 end
	 220: 
	 begin
	 sin <= -6; cos <= -8;  
	 end
	 221: 
	 begin
	 sin <= -7; cos <= -8; 
	 end
	 222: 
	 begin
	 sin <= -7; cos <= -7; 
	 end
	 223: 
	 begin
	 sin <= -7; cos <= -7;
	 end
	 224: 
	 begin
	 sin <= -7; cos <= -7;  
	 end
	 225: 
	 begin
	 sin <= -7; cos <= -7; 
	 end
	 226: 
	 begin
	 sin <= -7; cos <= -7; 
	 end
	 227: 
	 begin
	 sin <= -7; cos <= -7;
	 end
	 228: 
	 begin
	 sin <= -7; cos <= -7;  
	 end
	 229: 
	 begin
	 sin <= -8; cos <= -7; 
	 end
	 230: 
	 begin
	 sin <= -8; cos <= -6; 
	 end
	 231: 
	 begin
	 sin <= -8; cos <= -6;
	 end
	 232: 
	 begin
	 sin <= -8; cos <= -6;  
	 end
	 233: 
	 begin
	 sin <= -8; cos <= -6; 
	 end
	 234: 
	 begin
	 sin <= -8; cos <= -6; 
	 end
	 235: 
	 begin
	 sin <= -8; cos <= -6;
	 end
	 236: 
	 begin
	 sin <= -8; cos <= -6;  
	 end
	 237: 
	 begin
	 sin <= -8; cos <= -5; 
	 end
	 238: 
	 begin
	 sin <= -8; cos <= -5; 
	 end
	 239: 
	 begin
	 sin <= -9; cos <= -5;
	 end
	 240: 
	 begin
	 sin <= -9; cos <= -5;  
	 end
	 241: 
	 begin
	 sin <= -9; cos <= -5; 
	 end
	 242: 
	 begin
	 sin <= -9; cos <= -5; 
	 end
	 243: 
	 begin
	 sin <= -9; cos <= -5;
	 end
	 244: 
	 begin
	 sin <= -9; cos <= -4;  
	 end
	 245: 
	 begin
	 sin <= -9; cos <= -4; 
	 end
	 246: 
	 begin
	 sin <= -9; cos <= -4; 
	 end
	 247: 
	 begin
	 sin <= -9; cos <= -4;
	 end
	 248: 
	 begin
	 sin <= -9; cos <= -4;  
	 end
	 249: 
	 begin
	 sin <= -9; cos <= -4; 
	 end
	 250: 
	 begin
	 sin <= -9; cos <= -3; 
	 end
	 251: 
	 begin
	 sin <= -9; cos <= -3;
	 end
	 252: 
	 begin
	 sin <= -10; cos <= -3;  
	 end
	 253: 
	 begin
	 sin <= -10; cos <= -3; 
	 end
	 254: 
	 begin
	 sin <= -10; cos <= -3; 
	 end
	 255: 
	 begin
	 sin <= -10; cos <= -3;
	 end
	 256: 
	 begin
	 sin <= -10; cos <= -2;  
	 end
	 257: 
	 begin
	 sin <= -10; cos <= -2; 
	 end
	 258: 
	 begin
	 sin <= -10; cos <= -2; 
	 end
	 259: 
	 begin
	 sin <= -10; cos <= -2;
	 end
	 260: 
	 begin
	 sin <= -10; cos <= -2;  
	 end
	 261: 
	 begin
	 sin <= -10; cos <= -2; 
	 end
	 262: 
	 begin
	 sin <= -10; cos <= -1; 
	 end
	 263: 
	 begin
	 sin <= -10; cos <= -1;
	 end
	 264: 
	 begin
	 sin <= -10; cos <= -1;  
	 end
	 265: 
	 begin
	 sin <= -10; cos <= -1; 
	 end
	 266: 
	 begin
	 sin <= -10; cos <= -1; 
	 end
	 267: 
	 begin
	 sin <= -10; cos <= -1;
	 end
	 268: 
	 begin
	 sin <= -10; cos <= 0;  
	 end
	 269: 
	 begin
	 sin <= -10; cos <= 0; 
	 end
	 270:
	 begin
	 sin <= -10; cos <= 0; 
	 end
	 271: 
	 begin
	 sin <= -10; cos <= 0;
	 end
	 272: 
	 begin
	 sin <= -10; cos <= 0;  
	 end
	 273: 
	 begin
	 sin <= -10; cos <= 1; 
	 end
	 274: 
	 begin
	 sin <= -10; cos <= 1; 
	 end
	 275: 
	 begin
	 sin <= -10; cos <= 1;
	 end
	 276: 
	 begin
	 sin <= -10; cos <= 1;  
	 end
	 277: 
	 begin
	 sin <= -10; cos <= 1; 
	 end
	 278: 
	 begin
	 sin <= -10; cos <= 1; 
	 end
	 279: 
	 begin
	 sin <= -10; cos <= 2;
	 end
	 280: 
	 begin
	 sin <= -10; cos <= 2; 
	 end
	 281: 
	 begin
	 sin <= -10; cos <= 2; 
	 end
	 282: 
	 begin
	 sin <= -10; cos <= 2; 
	 end
	 283: 
	 begin
	 sin <= -10; cos <= 2;
	 end
	 284: 
	 begin
	 sin <= -10; cos <= 2; 
	 end
	 285: 
	 begin
	 sin <= -10; cos <= 3; 
	 end
	 286: 
	 begin
	 sin <= -10; cos <= 3; 
	 end
	 287: 
	 begin
	 sin <= -10; cos <= 3;
	 end
	 288: 
	 begin
	 sin <= -10; cos <= 3; 
	 end
	 289: 
	 begin
	 sin <= -9; cos <= 3; 
	 end
	 290: 
	 begin
	 sin <= -9; cos <= 3; 
	 end
	 291: 
	 begin
	 sin <= -9; cos <= 4;
	 end
	 292: 
	 begin
	 sin <= -9; cos <= 4; 
	 end
	 293: 
	 begin
	 sin <= -9; cos <= 4; 
	 end
	 294: 
	 begin
	 sin <= -9; cos <= 4; 
	 end
	 295: 
	 begin
	 sin <= -9; cos <= 4;
	 end
	 296: 
	 begin
	 sin <= -9; cos <= 4; 
	 end
	 297: 
	 begin
	 sin <= -9; cos <= 5; 
	 end
	 298: 
	 begin
	 sin <= -9; cos <= 5; 
	 end
	 299: 
	 begin
	 sin <= -9; cos <= 5;
	 end
	 300: 
	 begin
	 sin <= -9; cos <= 5; 
	 end
	 301: 
	 begin
	 sin <= -9; cos <= 5; 
	 end
	 302: 
	 begin
	 sin <= -8; cos <= 5; 
	 end
	 303: 
	 begin
	 sin <= -8; cos <= 5;
	 end
	 304: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 305: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 306: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 307: 
	 begin
	 sin <= -8; cos <= 6;
	 end
	 308: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 309: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 310: 
	 begin
	 sin <= -8; cos <= 6; 
	 end
	 311: 
	 begin
	 sin <= -8; cos <= 7;
	 end
	 312: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 313: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 314: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 315: 
	 begin
	 sin <= -7; cos <= 7;
	 end
	 316: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 317: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 318: 
	 begin
	 sin <= -7; cos <= 7; 
	 end
	 319: 
	 begin
	 sin <= -7; cos <= 8;
	 end
	 320: 
	 begin
	 sin <= -6; cos <= 8; 
	 end
	 321: 
	 begin
	 sin <= -6; cos <= 8; 
	 end
	 322: 
	 begin
	 sin <= -6; cos <= 8; 
	 end
	 323: 
	 begin
	 sin <= -6; cos <= 8;
	 end
	 324: 
	 begin
	 sin <= -6; cos <= 8; 
	 end
	 325: 
	 begin
	 sin <= -6; cos <= 8; 
	 end
	 326: 
	 begin
	 sin <= -5; cos <= 8; 
	 end
	 327: 
	 begin
	 sin <= -5; cos <= 8;
	 end
	 328: 
	 begin
	 sin <= -5; cos <= 8; 
	 end
	 329: 
	 begin
	 sin <= -5; cos <= 9; 
	 end
	 330: 
	 begin
	 sin <= -5; cos <= 9; 
	 end
	 331: 
	 begin
	 sin <= -5; cos <= 9;
	 end
	 332: 
	 begin
	 sin <= -5; cos <= 9; 
	 end
	 333: 
	 begin
	 sin <= -5; cos <= 9; 
	 end
	 334: 
	 begin
	 sin <= -4; cos <= 9; 
	 end
	 335: 
	 begin
	 sin <= -4; cos <= 9;
	 end
	 336: 
	 begin
	 sin <= -4; cos <= 9; 
	 end
	 337: 
	 begin
	 sin <= -4; cos <= 9; 
	 end
	 338: 
	 begin
	 sin <= -4; cos <= 9; 
	 end
	 339: 
	 begin
	 sin <= -4; cos <= 9;
	 end
	 340: 
	 begin
	 sin <= -3; cos <= 9; 
	 end
	 341: 
	 begin
	 sin <= -3; cos <= 9; 
	 end
	 342: 
	 begin
	 sin <= -3; cos <= 10; 
	 end
	 343: 
	 begin
	 sin <= -3; cos <= 10;
	 end
	 344: 
	 begin
	 sin <= -3; cos <= 10; 
	 end
	 345: 
	 begin
	 sin <= -3; cos <= 10; 
	 end
	 346: 
	 begin
	 sin <= -2; cos <= 10; 
	 end
	 347: 
	 begin
	 sin <= -2; cos <= 10;
	 end
	 348: 
	 begin
	 sin <= -2; cos <= 10; 
	 end
	 349: 
	 begin
	 sin <= -2; cos <= 10; 
	 end
	 350: 
	 begin
	 sin <= -2; cos <= 10; 
	 end
	 351: 
	 begin
	 sin <= -2; cos <= 10;
	 end
	 352: 
	 begin
	 sin <= -1; cos <= 10; 
	 end
	 353: 
	 begin
	 sin <= -1; cos <= 10; 
	 end
	 354: 
	 begin
	 sin <= -1; cos <= 10; 
	 end
	 355: 
	 begin
	 sin <= -1; cos <= 10;
	 end
	 356: 
	 begin
	 sin <= -1; cos <= 10; 
	 end
	 357: 
	 begin
	 sin <= -1; cos <= 10; 
	 end
	 358: 
	 begin
	 sin <= -0; cos <= 10; 
	 end
	 359: 
	 begin
	 sin <= -0; cos <= 10;
	 end
	 360: 
	 begin
	 sin <= -0; cos <= 10;
    end
	 endcase
endmodule

