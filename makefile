
# source lib
SRC_LIB = @DEMLIB



.PHONY: cpymbr
cpymbr: httplib_url_encode.c
	system "CPYFRMSTMF FROMSTMF('$<') \
          TOMBR('/qsys.lib/@demlib.lib/qsrc3.file/urlenc.mbr') \
          MBROPT(*REPLACE) \
          STMFCCSID(1208) \
          DBFCCSID(5035)"

