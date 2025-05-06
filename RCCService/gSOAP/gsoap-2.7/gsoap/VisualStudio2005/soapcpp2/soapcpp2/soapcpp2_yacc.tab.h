typedef union
{	Symbol	*sym;
	LONG64	i;
	double	r;
	char	c;
	char	*s;
	Tnode	*typ;
	Storage	sto;
	Node	rec;
	Entry	*e;
} YYSTYPE;
#define	PRAGMA	257
#define	AUTO	258
#define	DOUBLE	259
#define	INT	260
#define	STRUCT	261
#define	BREAK	262
#define	ELSE	263
#define	LONG	264
#define	SWITCH	265
#define	CASE	266
#define	ENUM	267
#define	REGISTER	268
#define	TYPEDEF	269
#define	CHAR	270
#define	EXTERN	271
#define	RETURN	272
#define	UNION	273
#define	CONST	274
#define	FLOAT	275
#define	SHORT	276
#define	UNSIGNED	277
#define	CONTINUE	278
#define	FOR	279
#define	SIGNED	280
#define	VOID	281
#define	DEFAULT	282
#define	GOTO	283
#define	SIZEOF	284
#define	VOLATILE	285
#define	DO	286
#define	IF	287
#define	STATIC	288
#define	WHILE	289
#define	CLASS	290
#define	PRIVATE	291
#define	PROTECTED	292
#define	PUBLIC	293
#define	VIRTUAL	294
#define	INLINE	295
#define	OPERATOR	296
#define	LLONG	297
#define	BOOL	298
#define	CFALSE	299
#define	CTRUE	300
#define	WCHAR	301
#define	TIME	302
#define	USING	303
#define	NAMESPACE	304
#define	ULLONG	305
#define	MUSTUNDERSTAND	306
#define	SIZE	307
#define	FRIEND	308
#define	TEMPLATE	309
#define	EXPLICIT	310
#define	TYPENAME	311
#define	RESTRICT	312
#define	null	313
#define	NONE	314
#define	ID	315
#define	LAB	316
#define	TYPE	317
#define	LNG	318
#define	DBL	319
#define	CHR	320
#define	STR	321
#define	PA	322
#define	NA	323
#define	TA	324
#define	DA	325
#define	MA	326
#define	AA	327
#define	XA	328
#define	OA	329
#define	LA	330
#define	RA	331
#define	OR	332
#define	AN	333
#define	EQ	334
#define	NE	335
#define	LE	336
#define	GE	337
#define	LS	338
#define	RS	339
#define	AR	340
#define	PP	341
#define	NN	342


extern YYSTYPE yylval;
