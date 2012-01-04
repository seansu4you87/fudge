# generate-area ClassName:SuperClass Type1:var1,var2 Type2:var3
- creates files
	- area/ClassName.h
		- if Type* is something fudge knows about, then it should have proper @class line
	- area/ClassName.m
		- if Type* is something fudge knows about, then it should have proper #import line

- If area == model, creates Parser files
	- model/parser/ClassNameParser.h
	- model/parser/ClassNameParser.m

- Type1(nonatomic, atomic, assign, retain, readonly, etc) smart property setting overrides




