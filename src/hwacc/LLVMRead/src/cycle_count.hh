#ifndef __CYCLE_COUNT_HH__

#define __CYCLE_COUNT_HH__


#define CYCLECOUNTRET				1
#define CYCLECOUNTBR				1
#define CYCLECOUNTSWITCH			1
#define CYCLECOUNTINDIRECTBR		1
#define CYCLECOUNTINVOKE			1
#define CYCLECOUNTRESUME			1
#define CYCLECOUNTUNREACHABLE		1

#define CYCLECOUNTADD				1
#define CYCLECOUNTSUB				1
#define CYCLECOUNTMUL				1
#define CYCLECOUNTUDIV				1
#define CYCLECOUNTSDIV				1
#define CYCLECOUNTUREM				1
#define CYCLECOUNTSREM				1

#define CYCLECOUNTFADD				5
#define CYCLECOUNTFSUB				5
#define CYCLECOUNTFMUL				3
#define CYCLECOUNTFDIV				6
#define CYCLECOUNTFREM				5

#define CYCLECOUNTSHL				1
#define CYCLECOUNTLSHR				1
#define CYCLECOUNTASHR				1
#define CYCLECOUNTAND				1
#define CYCLECOUNTOR				1
#define CYCLECOUNTXOR				1
	
#define CYCLECOUNTEXTRACTELEMENT	1
#define CYCLECOUNTINSERTELEMENT		1
#define CYCLECOUNTSHUFFLEVECTOR		1

#define CYCLECOUNTEXTRACTVALUE		1
#define CYCLECOUNTINSERTVALUE		1

#define CYCLECOUNTALLOCA			1
#define CYCLECOUNTLOAD				1
#define CYCLECOUNTSTORE				1
#define CYCLECOUNTFENCE				1
#define CYCLECOUNTCMPXCHG			1
#define CYCLECOUNTATOMICRMW			1
#define CYCLECOUNTGETELEMENTPTR		1

#define CYCLECOUNTTRUNC				1
#define CYCLECOUNTZEXT				1
#define CYCLECOUNTSEXT				1
#define CYCLECOUNTFPTRUNC			1
#define CYCLECOUNTFPEXT				1
#define CYCLECOUNTFPTOUI			1
#define CYCLECOUNTFPTOSI			1
#define CYCLECOUNTUITOFP			1
#define CYCLECOUNTSITOFP			1
#define CYCLECOUNTPTRTOINT			1
#define CYCLECOUNTINTTOPTR			1
#define CYCLECOUNTBITCAST			1
#define CYCLECOUNTADDRSPACECAST		1

#define CYCLECOUNTICMP				1
#define CYCLECOUNTFCMP				1
#define CYCLECOUNTPHI				1
#define CYCLECOUNTSELECT			1
#define CYCLECOUNTCALL				1
#define CYCLECOUNTVAARG				1
#define CYCLECOUNTLANDINGPAD		1
#define CYCLECOUNTCATCHPAD			1
#define CYCLECOUNTCLEANUPPAD		1


#endif //__CYCLE_COUNT_HH__
