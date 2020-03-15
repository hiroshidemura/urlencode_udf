
# program library
PGM_LIB := @DEMLIB

# source library for cpymbr
SRC_LIB := $(SRC_LIB)

#COMPILE OPTION
OUTPUT := OUTPUT(*NONE)


.PHONY: compile
compile: url_enc url_dec
	system " CRTSRVPGM SRVPGM($(PGM_LIB)/URLENC) \
    MODULE($(PGM_LIB)/URLENC $(PGM_LIB)/URLDEC) EXPORT(*ALL)"

url_enc: httplib_url_encode.c
	$(crtcmod)

url_dec: httplib_url_decode.c
	$(crtcmod)

.PHONY: cpymbr
cpymbr: httplib_url_encode.c httplib_url_decode.c
	system "CPYFRMSTMF FROMSTMF('$<') \
          TOMBR('/qsys.lib/@demlib.lib/qsrc3.file/urlenc.mbr') \
          MBROPT(*REPLACE) \
          STMFCCSID(1208) \
          DBFCCSID(5035)"


define crtcmod
 system "CRTCMOD  MODULE($(PGM_LIB)/$@) \
 SRCSTMF('$<') LOCALETYPE(*LOCALEUTF) TGTCCSID(1399) \
 DBGVIEW(*SOURCE) $(OUTPUT)"
endef


