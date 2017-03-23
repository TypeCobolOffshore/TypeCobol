000100 IDENTIFICATION DIVISION.                                         SQ2184.2
000200 PROGRAM-ID.                                                      SQ2184.2
000300     SQ218A.                                                      SQ2184.2
000400****************************************************************  SQ2184.2
000500*                                                              *  SQ2184.2
000600*    VALIDATION FOR:-                                          *  SQ2184.2
000700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SQ2184.2
000800*                                                              *  SQ2184.2
000900*    CREATION DATE     /     VALIDATION DATE                   *  SQ2184.2
001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SQ2184.2
001100*                                                              *  SQ2184.2
001200*       THIS ROUTINE CHECKS  THE                                  SQ2184.2
001300*               RECORD DELIMITER IS STANDARD-1    CLAUSE.         SQ2184.2
001400*                                                                 SQ2184.2
001500*            SEE  VII-13.                                         SQ2184.2
001600*                                                                 SQ2184.2
001700*                                                                 SQ2184.2
001800*       THIS ROUTINE BUILDS A SEQUENTIAL TAPE FILE WHICH CONTAINS SQ2184.2
001900*    BOTH 120 CHARACTER AND 151 CHARACTER RECORDS.  THE TAPE      SQ2184.2
002000*    CONSISTS OF 1 SHORT, 1 LONG, 10 SHORT, 100 LONG, AND 338     SQ2184.2
002100*    SHORT RECORDS FOR A TOTAL OF 450 RECORDS IN THE FILE.        SQ2184.2
002200*    THE TAPE IS READ AND FIELDS IN THE RECORDS ARE CHECKED       SQ2184.2
002300*    AGAINST THE EXPECTED VALUES.                                 SQ2184.2
002400*                                                                 SQ2184.2
002500*       AN INFORMATION SECTION AT THE END OF THE ROUTINE CHECKS   SQ2184.2
002600*    THE FIELD WHICH CONTAINS THE XRECORD-NUMBER.  THIS FIELD IS  SQ2184.2
002700*    PART OF A LONG RECORD ONLY.  IF THE XRECORD-NUMBER IS THERE  SQ2184.2
002800*    FOR A SHORT RECORD, IT MEANS THE MAXIMUM SIZE RECORD IS      SQ2184.2
002900*    ALWAYS WRITTEN.                                              SQ2184.2
003000 ENVIRONMENT DIVISION.                                            SQ2184.2
003100 CONFIGURATION SECTION.                                           SQ2184.2
003200 SOURCE-COMPUTER.                                                 SQ2184.2
003300     XXXXX082.                                                    SQ2184.2
003400 OBJECT-COMPUTER.                                                 SQ2184.2
003500     XXXXX083.                                                    SQ2184.2
003600 INPUT-OUTPUT SECTION.                                            SQ2184.2
003700 FILE-CONTROL.                                                    SQ2184.2
003800     SELECT RAW-DATA   ASSIGN TO                                  SQ2184.2
003900     XXXXX062                                                     SQ2184.2
004000            ORGANIZATION IS INDEXED                               SQ2184.2
004100            ACCESS MODE IS RANDOM                                 SQ2184.2
004200            RECORD KEY IS RAW-DATA-KEY.                           SQ2184.2
004300     SELECT PRINT-FILE ASSIGN TO                                  SQ2184.2
004400     XXXXX055.                                                    SQ2184.2
004500     SELECT SQ-VS6 ASSIGN                                         SQ2184.2
004600     XXXXX001                                                     SQ2184.2
004700     ORGANIZATION IS SEQUENTIAL                                   SQ2184.2
004800     RECORD DELIMITER IS STANDARD-1.                              SQ2184.2
004900 DATA DIVISION.                                                   SQ2184.2
005000 FILE SECTION.                                                    SQ2184.2
005100                                                                  SQ2184.2
005200 FD  RAW-DATA.                                                    SQ2184.2
005300                                                                  SQ2184.2
005400 01  RAW-DATA-SATZ.                                               SQ2184.2
005500     05  RAW-DATA-KEY        PIC X(6).                            SQ2184.2
005600     05  C-DATE              PIC 9(6).                            SQ2184.2
005700     05  C-TIME              PIC 9(8).                            SQ2184.2
005800     05  C-NO-OF-TESTS       PIC 99.                              SQ2184.2
005900     05  C-OK                PIC 999.                             SQ2184.2
006000     05  C-ALL               PIC 999.                             SQ2184.2
006100     05  C-FAIL              PIC 999.                             SQ2184.2
006200     05  C-DELETED           PIC 999.                             SQ2184.2
006300     05  C-INSPECT           PIC 999.                             SQ2184.2
006400     05  C-NOTE              PIC X(13).                           SQ2184.2
006500     05  C-INDENT            PIC X.                               SQ2184.2
006600     05  C-ABORT             PIC X(8).                            SQ2184.2
006700 FD  PRINT-FILE                                                   SQ2184.2
006800     LABEL RECORDS                                                SQ2184.2
006900     XXXXX084                                                     SQ2184.2
007000     DATA RECORD IS PRINT-REC DUMMY-RECORD                        SQ2184.2
007100               .                                                  SQ2184.2
007200 01  PRINT-REC PICTURE X(120).                                    SQ2184.2
007300 01  DUMMY-RECORD PICTURE X(120).                                 SQ2184.2
007400 FD  SQ-VS6                                                       SQ2184.2
007500     RECORD CONTAINS 120 TO 151 CHARACTERS                        SQ2184.2
007600     LABEL RECORDS ARE STANDARD                                   SQ2184.2
007700     DATA RECORDS ARE SQ-VS6R1-M-G-120  SQ-VS6R2-M-G-151          SQ2184.2
007800     .                                                            SQ2184.2
007900 01  SQ-VS6R1-M-G-120.                                            SQ2184.2
008000     02  SQ-VS6R1-FIRST PIC X(120).                               SQ2184.2
008100 01  SQ-VS6R2-M-G-151.                                            SQ2184.2
008200     02  SQ-VS6R2-FIRST  PIC X(120).                              SQ2184.2
008300     02  LONG-OR-SHORT  PIC X(5).                                 SQ2184.2
008400     02  SQ-VS6-RECNO  PIC X(5).                                  SQ2184.2
008500     02  SQ-VS6-FILLER  PIC X(21).                                SQ2184.2
008600 WORKING-STORAGE SECTION.                                         SQ2184.2
008700 01  SAVE-COUNT-OF-RECS  PIC X(5).                                SQ2184.2
008800 01  COUNT-OF-RECS  PIC S9(5) COMP.                               SQ2184.2
008900 01  RECORDS-IN-ERROR  PIC S9(5) COMP.                            SQ2184.2
009000 01  ERROR-FLAG PIC 9.                                            SQ2184.2
009100 01  EOF-FLAG  PIC 9.                                             SQ2184.2
009200 01  DUMP-AREA.                                                   SQ2184.2
009300     02  TYPE-OF-REC PICTURE X(5).                                SQ2184.2
009400     02  RECNO  PIC 9(5).                                         SQ2184.2
009500     02  REC-FILLER  PIC X(21).                                   SQ2184.2
009600 01  FILE-RECORD-INFORMATION-REC.                                 SQ2184.2
009700     03 FILE-RECORD-INFO-SKELETON.                                SQ2184.2
009800        05 FILLER                 PICTURE X(48)       VALUE       SQ2184.2
009900             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  SQ2184.2
010000        05 FILLER                 PICTURE X(46)       VALUE       SQ2184.2
010100             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    SQ2184.2
010200        05 FILLER                 PICTURE X(26)       VALUE       SQ2184.2
010300             ",LFIL=000000,ORG=  ,LBLR= ".                        SQ2184.2
010400        05 FILLER                 PICTURE X(37)       VALUE       SQ2184.2
010500             ",RECKEY=                             ".             SQ2184.2
010600        05 FILLER                 PICTURE X(38)       VALUE       SQ2184.2
010700             ",ALTKEY1=                             ".            SQ2184.2
010800        05 FILLER                 PICTURE X(38)       VALUE       SQ2184.2
010900             ",ALTKEY2=                             ".            SQ2184.2
011000        05 FILLER                 PICTURE X(7)        VALUE SPACE.SQ2184.2
011100     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              SQ2184.2
011200        05 FILE-RECORD-INFO-P1-120.                               SQ2184.2
011300           07 FILLER              PIC X(5).                       SQ2184.2
011400           07 XFILE-NAME           PIC X(6).                      SQ2184.2
011500           07 FILLER              PIC X(8).                       SQ2184.2
011600           07 XRECORD-NAME         PIC X(6).                      SQ2184.2
011700           07 FILLER              PIC X(1).                       SQ2184.2
011800           07 REELUNIT-NUMBER     PIC 9(1).                       SQ2184.2
011900           07 FILLER              PIC X(7).                       SQ2184.2
012000           07 XRECORD-NUMBER       PIC 9(6).                      SQ2184.2
012100           07 FILLER              PIC X(6).                       SQ2184.2
012200           07 UPDATE-NUMBER       PIC 9(2).                       SQ2184.2
012300           07 FILLER              PIC X(5).                       SQ2184.2
012400           07 ODO-NUMBER          PIC 9(4).                       SQ2184.2
012500           07 FILLER              PIC X(5).                       SQ2184.2
012600           07 XPROGRAM-NAME        PIC X(5).                      SQ2184.2
012700           07 FILLER              PIC X(7).                       SQ2184.2
012800           07 XRECORD-LENGTH       PIC 9(6).                      SQ2184.2
012900           07 FILLER              PIC X(7).                       SQ2184.2
013000           07 CHARS-OR-RECORDS    PIC X(2).                       SQ2184.2
013100           07 FILLER              PIC X(1).                       SQ2184.2
013200           07 XBLOCK-SIZE          PIC 9(4).                      SQ2184.2
013300           07 FILLER              PIC X(6).                       SQ2184.2
013400           07 RECORDS-IN-FILE     PIC 9(6).                       SQ2184.2
013500           07 FILLER              PIC X(5).                       SQ2184.2
013600           07 XFILE-ORGANIZATION   PIC X(2).                      SQ2184.2
013700           07 FILLER              PIC X(6).                       SQ2184.2
013800           07 XLABEL-TYPE          PIC X(1).                      SQ2184.2
013900        05 FILE-RECORD-INFO-P121-240.                             SQ2184.2
014000           07 FILLER              PIC X(8).                       SQ2184.2
014100           07 XRECORD-KEY          PIC X(29).                     SQ2184.2
014200           07 FILLER              PIC X(9).                       SQ2184.2
014300           07 ALTERNATE-KEY1      PIC X(29).                      SQ2184.2
014400           07 FILLER              PIC X(9).                       SQ2184.2
014500           07 ALTERNATE-KEY2      PIC X(29).                      SQ2184.2
014600           07 FILLER              PIC X(7).                       SQ2184.2
014700 01  TEST-RESULTS.                                                SQ2184.2
014800     02 FILLER                    PICTURE X VALUE SPACE.          SQ2184.2
014900     02 FEATURE                   PICTURE X(20) VALUE SPACE.      SQ2184.2
015000     02 FILLER                    PICTURE X VALUE SPACE.          SQ2184.2
015100     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       SQ2184.2
015200     02 FILLER                    PICTURE X  VALUE SPACE.         SQ2184.2
015300     02  PAR-NAME.                                                SQ2184.2
015400       03 FILLER PICTURE X(12) VALUE SPACE.                       SQ2184.2
015500       03  PARDOT-X PICTURE X  VALUE SPACE.                       SQ2184.2
015600       03 DOTVALUE PICTURE 99  VALUE ZERO.                        SQ2184.2
015700       03 FILLER PIC X(5) VALUE SPACE.                            SQ2184.2
015800     02 FILLER PIC X(10) VALUE SPACE.                             SQ2184.2
015900     02 RE-MARK PIC X(61).                                        SQ2184.2
016000 01  TEST-COMPUTED.                                               SQ2184.2
016100     02 FILLER PIC X(30) VALUE SPACE.                             SQ2184.2
016200     02 FILLER PIC X(17) VALUE "       COMPUTED=".                SQ2184.2
016300     02 COMPUTED-X.                                               SQ2184.2
016400     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      SQ2184.2
016500     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       SQ2184.2
016600     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      SQ2184.2
016700     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  SQ2184.2
016800     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  SQ2184.2
016900     03       CM-18V0 REDEFINES COMPUTED-A.                       SQ2184.2
017000         04 COMPUTED-18V0                   PICTURE -9(18).       SQ2184.2
017100         04 FILLER                          PICTURE X.            SQ2184.2
017200     03 FILLER PIC X(50) VALUE SPACE.                             SQ2184.2
017300 01  TEST-CORRECT.                                                SQ2184.2
017400     02 FILLER PIC X(30) VALUE SPACE.                             SQ2184.2
017500     02 FILLER PIC X(17) VALUE "       CORRECT =".                SQ2184.2
017600     02 CORRECT-X.                                                SQ2184.2
017700     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      SQ2184.2
017800     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         SQ2184.2
017900     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      SQ2184.2
018000     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  SQ2184.2
018100     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  SQ2184.2
018200     03      CR-18V0 REDEFINES CORRECT-A.                         SQ2184.2
018300         04 CORRECT-18V0                    PICTURE -9(18).       SQ2184.2
018400         04 FILLER                          PICTURE X.            SQ2184.2
018500     03 FILLER PIC X(50) VALUE SPACE.                             SQ2184.2
018600 01  CCVS-C-1.                                                    SQ2184.2
018700     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PASQ2184.2
018800-    "SS  PARAGRAPH-NAME                                          SQ2184.2
018900-    "        REMARKS".                                           SQ2184.2
019000     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   SQ2184.2
019100 01  CCVS-C-2.                                                    SQ2184.2
019200     02 FILLER PICTURE IS X VALUE IS SPACE.                       SQ2184.2
019300     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 SQ2184.2
019400     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   SQ2184.2
019500     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   SQ2184.2
019600     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   SQ2184.2
019700 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         SQ2184.2
019800 01  REC-CT PICTURE 99 VALUE ZERO.                                SQ2184.2
019900 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        SQ2184.2
020000 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  SQ2184.2
020100 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          SQ2184.2
020200 01  PASS-COUNTER PIC 999 VALUE ZERO.                             SQ2184.2
020300 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              SQ2184.2
020400 01  ERROR-HOLD PIC 999 VALUE ZERO.                               SQ2184.2
020500 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           SQ2184.2
020600 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            SQ2184.2
020700 01  CCVS-H-1.                                                    SQ2184.2
020800     02  FILLER   PICTURE X(27)  VALUE SPACE.                     SQ2184.2
020900     02 FILLER PICTURE X(67) VALUE                                SQ2184.2
021000     " FEDERAL SOFTWARE TESTING CENTER COBOL COMPILER VALIDATION  SQ2184.2
021100-    " SYSTEM".                                                   SQ2184.2
021200     02  FILLER     PICTURE X(26)  VALUE SPACE.                   SQ2184.2
021300 01  CCVS-H-2.                                                    SQ2184.2
021400     02 FILLER PICTURE X(52) VALUE IS                             SQ2184.2
021500     "CCVS85 FSTC COPY, NOT FOR DISTRIBUTION.".                   SQ2184.2
021600     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   SQ2184.2
021700     02 TEST-ID PICTURE IS X(9).                                  SQ2184.2
021800     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   SQ2184.2
021900 01  CCVS-H-3.                                                    SQ2184.2
022000     02  FILLER PICTURE X(34) VALUE                               SQ2184.2
022100     " FOR OFFICIAL USE ONLY    ".                                SQ2184.2
022200     02  FILLER PICTURE X(58) VALUE                               SQ2184.2
022300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SQ2184.2
022400     02  FILLER PICTURE X(28) VALUE                               SQ2184.2
022500     "  COPYRIGHT   1985 ".                                       SQ2184.2
022600 01  CCVS-E-1.                                                    SQ2184.2
022700     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   SQ2184.2
022800     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        SQ2184.2
022900     02 ID-AGAIN PICTURE IS X(9).                                 SQ2184.2
023000     02 FILLER PICTURE X(45) VALUE IS                             SQ2184.2
023100     " NTIS DISTRIBUTION COBOL 85".                               SQ2184.2
023200 01  CCVS-E-2.                                                    SQ2184.2
023300     02  FILLER                   PICTURE X(31)  VALUE            SQ2184.2
023400     SPACE.                                                       SQ2184.2
023500     02  FILLER                   PICTURE X(21)  VALUE SPACE.     SQ2184.2
023600     02 CCVS-E-2-2.                                               SQ2184.2
023700         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            SQ2184.2
023800         03 FILLER PICTURE IS X VALUE IS SPACE.                   SQ2184.2
023900         03 ENDER-DESC PIC X(46) VALUE "ERRORS ENCOUNTERED".      SQ2184.2
024000 01  CCVS-E-3.                                                    SQ2184.2
024100     02  FILLER PICTURE X(22) VALUE                               SQ2184.2
024200     " FOR OFFICIAL USE ONLY".                                    SQ2184.2
024300     02  FILLER PICTURE X(12) VALUE SPACE.                        SQ2184.2
024400     02  FILLER PICTURE X(58) VALUE                               SQ2184.2
024500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SQ2184.2
024600     02  FILLER PICTURE X(13) VALUE SPACE.                        SQ2184.2
024700     02 FILLER PIC X(15) VALUE " COPYRIGHT 1985".                 SQ2184.2
024800 01  CCVS-E-4.                                                    SQ2184.2
024900     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           SQ2184.2
025000     02 FILLER PIC XXXX VALUE " OF ".                             SQ2184.2
025100     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           SQ2184.2
025200     02 FILLER PIC X(40) VALUE                                    SQ2184.2
025300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       SQ2184.2
025400 01  XXINFO.                                                      SQ2184.2
025500     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    SQ2184.2
025600     02 INFO-TEXT.                                                SQ2184.2
025700     04 FILLER PIC X(20) VALUE SPACE.                             SQ2184.2
025800     04 XXCOMPUTED PIC X(20).                                     SQ2184.2
025900     04 FILLER PIC X(5) VALUE SPACE.                              SQ2184.2
026000     04 XXCORRECT PIC X(20).                                      SQ2184.2
026100 01  HYPHEN-LINE.                                                 SQ2184.2
026200     02 FILLER PICTURE IS X VALUE IS SPACE.                       SQ2184.2
026300     02 FILLER PICTURE IS X(65) VALUE IS "************************SQ2184.2
026400-    "*****************************************".                 SQ2184.2
026500     02 FILLER PICTURE IS X(54) VALUE IS "************************SQ2184.2
026600-    "******************************".                            SQ2184.2
026700 01  CCVS-PGM-ID PIC X(6) VALUE                                   SQ2184.2
026800     "SQ218A".                                                    SQ2184.2
026900 PROCEDURE DIVISION.                                              SQ2184.2
027000 CCVS1 SECTION.                                                   SQ2184.2
027100 OPEN-FILES.                                                      SQ2184.2
027200     OPEN I-O RAW-DATA.                                           SQ2184.2
027300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            SQ2184.2
027400     READ RAW-DATA INVALID KEY GO TO END-E-1.                     SQ2184.2
027500     MOVE "ABORTED " TO C-ABORT.                                  SQ2184.2
027600     ADD 1 TO C-NO-OF-TESTS.                                      SQ2184.2
027700     ACCEPT C-DATE  FROM DATE.                                    SQ2184.2
027800     ACCEPT C-TIME  FROM TIME.                                    SQ2184.2
027900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             SQ2184.2
028000 END-E-1.                                                         SQ2184.2
028100     CLOSE RAW-DATA.                                              SQ2184.2
028200     OPEN     OUTPUT PRINT-FILE.                                  SQ2184.2
028300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   SQ2184.2
028400     MOVE    SPACE TO TEST-RESULTS.                               SQ2184.2
028500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             SQ2184.2
028600     MOVE ZERO TO REC-SKL-SUB.                                    SQ2184.2
028700     PERFORM CCVS-INIT-FILE 9 TIMES.                              SQ2184.2
028800 CCVS-INIT-FILE.                                                  SQ2184.2
028900     ADD 1 TO REC-SKL-SUB.                                        SQ2184.2
029000     MOVE FILE-RECORD-INFO-SKELETON TO                            SQ2184.2
029100                  FILE-RECORD-INFO (REC-SKL-SUB).                 SQ2184.2
029200 CCVS-INIT-EXIT.                                                  SQ2184.2
029300     GO TO CCVS1-EXIT.                                            SQ2184.2
029400 CLOSE-FILES.                                                     SQ2184.2
029500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   SQ2184.2
029600     OPEN I-O RAW-DATA.                                           SQ2184.2
029700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            SQ2184.2
029800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     SQ2184.2
029900     MOVE "OK.     " TO C-ABORT.                                  SQ2184.2
030000     MOVE PASS-COUNTER TO C-OK.                                   SQ2184.2
030100     MOVE ERROR-HOLD   TO C-ALL.                                  SQ2184.2
030200     MOVE ERROR-COUNTER TO C-FAIL.                                SQ2184.2
030300     MOVE DELETE-CNT TO C-DELETED.                                SQ2184.2
030400     MOVE INSPECT-COUNTER TO C-INSPECT.                           SQ2184.2
030500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             SQ2184.2
030600 END-E-2.                                                         SQ2184.2
030700     CLOSE RAW-DATA.                                              SQ2184.2
030800 TERMINATE-CCVS.                                                  SQ2184.2
030900     EXIT PROGRAM.                                                SQ2184.2
031000 TERMINATE-CALL.                                                  SQ2184.2
031100     STOP     RUN.                                                SQ2184.2
031200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         SQ2184.2
031300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           SQ2184.2
031400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          SQ2184.2
031500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          SQ2184.2
031600     MOVE "****TEST DELETED****" TO RE-MARK.                      SQ2184.2
031700 PRINT-DETAIL.                                                    SQ2184.2
031800     IF REC-CT NOT EQUAL TO ZERO                                  SQ2184.2
031900             MOVE "." TO PARDOT-X                                 SQ2184.2
032000             MOVE REC-CT TO DOTVALUE.                             SQ2184.2
032100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      SQ2184.2
032200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               SQ2184.2
032300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 SQ2184.2
032400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 SQ2184.2
032500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              SQ2184.2
032600     MOVE SPACE TO CORRECT-X.                                     SQ2184.2
032700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         SQ2184.2
032800     MOVE     SPACE TO RE-MARK.                                   SQ2184.2
032900 HEAD-ROUTINE.                                                    SQ2184.2
033000     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SQ2184.2
033100     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   SQ2184.2
033200     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   SQ2184.2
033300 COLUMN-NAMES-ROUTINE.                                            SQ2184.2
033400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SQ2184.2
033500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SQ2184.2
033600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        SQ2184.2
033700 END-ROUTINE.                                                     SQ2184.2
033800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.SQ2184.2
033900 END-RTN-EXIT.                                                    SQ2184.2
034000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SQ2184.2
034100 END-ROUTINE-1.                                                   SQ2184.2
034200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      SQ2184.2
034300      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   SQ2184.2
034400      ADD PASS-COUNTER TO ERROR-HOLD.                             SQ2184.2
034500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   SQ2184.2
034600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            SQ2184.2
034700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              SQ2184.2
034800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                SQ2184.2
034900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           SQ2184.2
035000  END-ROUTINE-12.                                                 SQ2184.2
035100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        SQ2184.2
035200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      SQ2184.2
035300         MOVE "NO " TO ERROR-TOTAL                                SQ2184.2
035400         ELSE                                                     SQ2184.2
035500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       SQ2184.2
035600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           SQ2184.2
035700     PERFORM WRITE-LINE.                                          SQ2184.2
035800 END-ROUTINE-13.                                                  SQ2184.2
035900     IF DELETE-CNT IS EQUAL TO ZERO                               SQ2184.2
036000         MOVE "NO " TO ERROR-TOTAL  ELSE                          SQ2184.2
036100         MOVE DELETE-CNT TO ERROR-TOTAL.                          SQ2184.2
036200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   SQ2184.2
036300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SQ2184.2
036400      IF   INSPECT-COUNTER EQUAL TO ZERO                          SQ2184.2
036500          MOVE "NO " TO ERROR-TOTAL                               SQ2184.2
036600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   SQ2184.2
036700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            SQ2184.2
036800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          SQ2184.2
036900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SQ2184.2
037000 WRITE-LINE.                                                      SQ2184.2
037100     ADD 1 TO RECORD-COUNT.                                       SQ2184.2
037200     IF RECORD-COUNT GREATER 50                                   SQ2184.2
037300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          SQ2184.2
037400         MOVE SPACE TO DUMMY-RECORD                               SQ2184.2
037500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  SQ2184.2
037600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             SQ2184.2
037700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     SQ2184.2
037800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          SQ2184.2
037900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          SQ2184.2
038000         MOVE ZERO TO RECORD-COUNT.                               SQ2184.2
038100     PERFORM WRT-LN.                                              SQ2184.2
038200 WRT-LN.                                                          SQ2184.2
038300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               SQ2184.2
038400     MOVE SPACE TO DUMMY-RECORD.                                  SQ2184.2
038500 BLANK-LINE-PRINT.                                                SQ2184.2
038600     PERFORM WRT-LN.                                              SQ2184.2
038700 FAIL-ROUTINE.                                                    SQ2184.2
038800     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   SQ2184.2
038900     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    SQ2184.2
039000     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    SQ2184.2
039100     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     SQ2184.2
039200     GO TO FAIL-ROUTINE-EX.                                       SQ2184.2
039300 FAIL-ROUTINE-WRITE.                                              SQ2184.2
039400     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           SQ2184.2
039500     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   SQ2184.2
039600 FAIL-ROUTINE-EX. EXIT.                                           SQ2184.2
039700 BAIL-OUT.                                                        SQ2184.2
039800     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       SQ2184.2
039900     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               SQ2184.2
040000 BAIL-OUT-WRITE.                                                  SQ2184.2
040100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  SQ2184.2
040200     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     SQ2184.2
040300 BAIL-OUT-EX. EXIT.                                               SQ2184.2
040400 CCVS1-EXIT.                                                      SQ2184.2
040500     EXIT.                                                        SQ2184.2
040600 SECT-SQ218A-0001 SECTION.                                        SQ2184.2
040700 WRITE-INIT-GF-01.                                                SQ2184.2
040800     MOVE "SQ-VS6" TO XFILE-NAME (1).                             SQ2184.2
040900     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       SQ2184.2
041000     MOVE "RC" TO CHARS-OR-RECORDS (1).                           SQ2184.2
041100     MOVE 0001 TO XBLOCK-SIZE (1).                                SQ2184.2
041200     MOVE 000450 TO RECORDS-IN-FILE (1).                          SQ2184.2
041300     MOVE "SQ" TO XFILE-ORGANIZATION (1).                         SQ2184.2
041400     MOVE "S" TO XLABEL-TYPE (1).                                 SQ2184.2
041500     MOVE 000000 TO XRECORD-NUMBER (1).                           SQ2184.2
041600     MOVE ZERO TO COUNT-OF-RECS.                                  SQ2184.2
041700     OPEN OUTPUT SQ-VS6.                                          SQ2184.2
041800     MOVE "MULTIPLE LENGTH RECS " TO SQ-VS6-FILLER.               SQ2184.2
041900 WRITE-TEST-GF-01.                                                SQ2184.2
042000     PERFORM WRITE-SHORT-REC.                                     SQ2184.2
042100     PERFORM WRITE-LONG-REC.                                      SQ2184.2
042200     PERFORM WRITE-SHORT-REC 10 TIMES.                            SQ2184.2
042300     PERFORM WRITE-LONG-REC 100 TIMES.                            SQ2184.2
042400     PERFORM WRITE-SHORT-REC 338 TIMES.                           SQ2184.2
042500 WRITE-WRITE-GF-01.                                               SQ2184.2
042600     MOVE "CREATE FILE SQ-VS6" TO FEATURE.                        SQ2184.2
042700     MOVE "WRITE-TEST-GF-01" TO PAR-NAME.                         SQ2184.2
042800     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   SQ2184.2
042900     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          SQ2184.2
043000     MOVE "FILE HAS 120 AND 151 CHAR RECS" TO RE-MARK.            SQ2184.2
043100     PERFORM PRINT-DETAIL.                                        SQ2184.2
043200*         A SEQUENTIAL TAPE FILE CONTAINING 450 RECORDS HAS       SQ2184.2
043300*    BEEN CREATED.  THE FILE CONTAINS RECORDS OF 120 CHARACTERS   SQ2184.2
043400*    AND RECORDS OF 151 CHARACTERS.  THE SEQUENCE IN WHICH THE    SQ2184.2
043500*    RECORDS WERE WRITTEN IS S-L-10S-100L-338S.                   SQ2184.2
043600 WRITE-CLOSE-GF-01.                                               SQ2184.2
043700     CLOSE SQ-VS6.                                                SQ2184.2
043800     GO TO READ-INIT-F1-01.                                       SQ2184.2
043900 WRITE-SHORT-REC.                                                 SQ2184.2
044000     MOVE "R1-M-G" TO XRECORD-NAME (1).                           SQ2184.2
044100     MOVE 000120 TO XRECORD-LENGTH (1).                           SQ2184.2
044200     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
044300     MOVE COUNT-OF-RECS TO XRECORD-NUMBER (1).                    SQ2184.2
044400     MOVE "SHORT" TO LONG-OR-SHORT.                               SQ2184.2
044500     MOVE COUNT-OF-RECS TO SQ-VS6-RECNO.                          SQ2184.2
044600     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-VS6R1-FIRST.          SQ2184.2
044700     WRITE SQ-VS6R1-M-G-120.                                      SQ2184.2
044800 WRITE-LONG-REC.                                                  SQ2184.2
044900     MOVE "R2-M-G" TO XRECORD-NAME (1).                           SQ2184.2
045000     MOVE 000151 TO XRECORD-LENGTH (1).                           SQ2184.2
045100     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
045200     MOVE COUNT-OF-RECS TO XRECORD-NUMBER (1).                    SQ2184.2
045300     MOVE "LONG" TO LONG-OR-SHORT.                                SQ2184.2
045400     MOVE COUNT-OF-RECS TO SQ-VS6-RECNO.                          SQ2184.2
045500     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-VS6R2-FIRST.          SQ2184.2
045600     WRITE SQ-VS6R2-M-G-151.                                      SQ2184.2
045700 READ-INIT-F1-01.                                                 SQ2184.2
045800     MOVE ZERO TO COUNT-OF-RECS.                                  SQ2184.2
045900     MOVE ZERO TO EOF-FLAG.                                       SQ2184.2
046000     MOVE ZERO TO RECORDS-IN-ERROR.                               SQ2184.2
046100     MOVE ZERO TO ERROR-FLAG.                                     SQ2184.2
046200     OPEN INPUT SQ-VS6.                                           SQ2184.2
046300 READ-TEST-F1-01.                                                 SQ2184.2
046400     PERFORM READ-SHORT-REC THRU READ-SHORT-REC-EXIT.             SQ2184.2
046500     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
046600         MOVE "EOF ON FIRST READ" TO RE-MARK                      SQ2184.2
046700         GO TO READ-EOF-F1-06.                                    SQ2184.2
046800     IF ERROR-FLAG EQUAL TO 1                                     SQ2184.2
046900         GO TO READ-FAIL-F1-01.                                   SQ2184.2
047000 READ-PASS-F1-01.                                                 SQ2184.2
047100     PERFORM PASS.                                                SQ2184.2
047200     GO TO READ-WRITE-F1-01.                                      SQ2184.2
047300 READ-FAIL-F1-01.                                                 SQ2184.2
047400     MOVE "ERROR ON FIRST READ;VII-13 SR (2), GR (1,2)" TO RE-MARKSQ2184.2
047500     PERFORM FAIL.                                                SQ2184.2
047600 READ-WRITE-F1-01.                                                SQ2184.2
047700     MOVE "READ SHORT RECORD" TO FEATURE.                         SQ2184.2
047800     MOVE "READ-TEST-F1-01" TO PAR-NAME.                          SQ2184.2
047900     PERFORM PRINT-DETAIL.                                        SQ2184.2
048000     GO TO READ-INIT-F1-02.                                       SQ2184.2
048100 READ-SHORT-REC.                                                  SQ2184.2
048200     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
048300          GO TO READ-SHORT-REC-EXIT.                              SQ2184.2
048400     READ SQ-VS6 AT END                                           SQ2184.2
048500          MOVE 1 TO EOF-FLAG                                      SQ2184.2
048600          GO TO READ-SHORT-REC-EXIT.                              SQ2184.2
048700     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
048800     MOVE SQ-VS6R1-FIRST TO FILE-RECORD-INFO-P1-120 (1).          SQ2184.2
048900     IF XRECORD-NAME (1) NOT EQUAL TO "R1-M-G"                    SQ2184.2
049000          GO TO READ-SHORT-REC-ERROR.                             SQ2184.2
049100     IF XRECORD-LENGTH (1) NOT EQUAL TO 120                       SQ2184.2
049200          GO TO READ-SHORT-REC-ERROR.                             SQ2184.2
049300     IF COUNT-OF-RECS NOT EQUAL TO XRECORD-NUMBER (1)             SQ2184.2
049400          GO TO READ-SHORT-REC-ERROR.                             SQ2184.2
049500     IF XLABEL-TYPE (1) EQUAL TO "S"                              SQ2184.2
049600          GO TO READ-SHORT-REC-EXIT.                              SQ2184.2
049700 READ-SHORT-REC-ERROR.                                            SQ2184.2
049800     ADD 1 TO RECORDS-IN-ERROR.                                   SQ2184.2
049900     MOVE 1 TO ERROR-FLAG.                                        SQ2184.2
050000 READ-SHORT-REC-EXIT.                                             SQ2184.2
050100     EXIT.                                                        SQ2184.2
050200 READ-INIT-F1-02.                                                 SQ2184.2
050300     MOVE ZERO TO ERROR-FLAG.                                     SQ2184.2
050400 READ-TEST-F1-02.                                                 SQ2184.2
050500     PERFORM READ-LONG-REC THRU READ-LONG-REC-EXIT.               SQ2184.2
050600     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
050700          MOVE "EOF ON SECOND READ" TO RE-MARK                    SQ2184.2
050800          GO TO READ-EOF-F1-06.                                   SQ2184.2
050900     IF ERROR-FLAG EQUAL TO 1                                     SQ2184.2
051000          GO TO READ-FAIL-F1-02.                                  SQ2184.2
051100 READ-PASS-F1-02.                                                 SQ2184.2
051200     PERFORM PASS.                                                SQ2184.2
051300     GO TO READ-WRITE-F1-02.                                      SQ2184.2
051400 READ-FAIL-F1-02.                                                 SQ2184.2
051500     MOVE "ERROR ON SEC READ; VII-13 SR (2), GR (1,2)" TO RE-MARK SQ2184.2
051600     PERFORM FAIL.                                                SQ2184.2
051700 READ-WRITE-F1-02.                                                SQ2184.2
051800     MOVE "READ LONG RECORD" TO FEATURE.                          SQ2184.2
051900     MOVE "READ-TEST-F1-02" TO PAR-NAME.                          SQ2184.2
052000     PERFORM PRINT-DETAIL.                                        SQ2184.2
052100     GO TO READ-INIT-F1-03.                                       SQ2184.2
052200 READ-LONG-REC.                                                   SQ2184.2
052300     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
052400         GO TO READ-LONG-REC-EXIT.                                SQ2184.2
052500     READ SQ-VS6 END                                              SQ2184.2
052600         MOVE 1 TO EOF-FLAG                                       SQ2184.2
052700         GO TO READ-LONG-REC-EXIT.                                SQ2184.2
052800     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
052900     MOVE SQ-VS6R2-FIRST TO FILE-RECORD-INFO-P1-120 (1).          SQ2184.2
053000     IF XRECORD-NAME (1) NOT EQUAL TO "R2-M-G"                    SQ2184.2
053100         GO TO READ-LONG-REC-ERROR.                               SQ2184.2
053200     IF XRECORD-LENGTH (1) NOT EQUAL TO 151                       SQ2184.2
053300         GO TO READ-LONG-REC-ERROR.                               SQ2184.2
053400     MOVE COUNT-OF-RECS TO SAVE-COUNT-OF-RECS.                    SQ2184.2
053500     IF SAVE-COUNT-OF-RECS NOT EQUAL TO SQ-VS6-RECNO              SQ2184.2
053600         GO TO READ-LONG-REC-ERROR.                               SQ2184.2
053700     IF LONG-OR-SHORT EQUAL TO "LONG "                            SQ2184.2
053800         GO TO READ-LONG-REC-EXIT.                                SQ2184.2
053900 READ-LONG-REC-ERROR.                                             SQ2184.2
054000     ADD 1 TO RECORDS-IN-ERROR.                                   SQ2184.2
054100     MOVE 1 TO ERROR-FLAG.                                        SQ2184.2
054200 READ-LONG-REC-EXIT.                                              SQ2184.2
054300     EXIT.                                                        SQ2184.2
054400 READ-INIT-F1-03.                                                 SQ2184.2
054500     MOVE ZERO TO ERROR-FLAG.                                     SQ2184.2
054600 READ-TEST-F1-03.                                                 SQ2184.2
054700     PERFORM READ-SHORT-REC THRU READ-SHORT-REC-EXIT 10 TIMES.    SQ2184.2
054800     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
054900          MOVE "UNEXPECTED EOF" TO RE-MARK                        SQ2184.2
055000          GO TO READ-EOF-F1-06.                                   SQ2184.2
055100     IF ERROR-FLAG EQUAL TO 1                                     SQ2184.2
055200          GO TO READ-FAIL-F1-03.                                  SQ2184.2
055300 READ-PASS-F1-03.                                                 SQ2184.2
055400     PERFORM PASS.                                                SQ2184.2
055500     GO TO READ-WRITE-F1-03.                                      SQ2184.2
055600 READ-FAIL-F1-03.                                                 SQ2184.2
055700     MOVE "ERROR REA SHORT REC;VII-13 SR (2), GR (1,2)" TO RE-MARKSQ2184.2
055800     PERFORM FAIL.                                                SQ2184.2
055900 READ-WRITE-F1-03.                                                SQ2184.2
056000     MOVE "READ SHORT RECORDS" TO FEATURE.                        SQ2184.2
056100     MOVE "READ-TEST-F1-03" TO PAR-NAME.                          SQ2184.2
056200     PERFORM PRINT-DETAIL.                                        SQ2184.2
056300 READ-INIT-F1-04.                                                 SQ2184.2
056400     MOVE ZERO TO ERROR-FLAG.                                     SQ2184.2
056500 READ-TEST-F1-04.                                                 SQ2184.2
056600     PERFORM READ-LONG-REC THRU READ-LONG-REC-EXIT 100 TIMES.     SQ2184.2
056700     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
056800         MOVE "UNEXPECTED EOF" TO RE-MARK                         SQ2184.2
056900         GO TO READ-EOF-F1-06.                                    SQ2184.2
057000     IF ERROR-FLAG EQUAL TO 1                                     SQ2184.2
057100         GO TO READ-FAIL-F1-04.                                   SQ2184.2
057200 READ-PASS-F1-04.                                                 SQ2184.2
057300     PERFORM PASS.                                                SQ2184.2
057400     GO TO READ-WRITE-F1-04.                                      SQ2184.2
057500 READ-FAIL-F1-04.                                                 SQ2184.2
057600     PERFORM FAIL.                                                SQ2184.2
057700     MOVE "ERROR READING LONG RECORD" TO RE-MARK.                 SQ2184.2
057800 READ-WRITE-F1-04.                                                SQ2184.2
057900     MOVE "READ LONG RECORDS" TO FEATURE.                         SQ2184.2
058000     MOVE "READ-TEST-F1-04" TO PAR-NAME.                          SQ2184.2
058100     PERFORM PRINT-DETAIL.                                        SQ2184.2
058200 READ-INIT-F1-05.                                                 SQ2184.2
058300     MOVE ZERO TO ERROR-FLAG.                                     SQ2184.2
058400 READ-TEST-F1-05.                                                 SQ2184.2
058500     PERFORM READ-SHORT-REC THRU READ-SHORT-REC-EXIT 338 TIMES.   SQ2184.2
058600     IF EOF-FLAG EQUAL TO 1                                       SQ2184.2
058700         MOVE "UNEXPECTED EOF" TO RE-MARK                         SQ2184.2
058800         GO TO READ-EOF-F1-06.                                    SQ2184.2
058900     IF ERROR-FLAG EQUAL TO 1                                     SQ2184.2
059000         GO TO READ-FAIL-F1-05.                                   SQ2184.2
059100 READ-PASS-F1-05.                                                 SQ2184.2
059200     PERFORM PASS.                                                SQ2184.2
059300     GO TO READ-WRITE-F1-05.                                      SQ2184.2
059400 READ-FAIL-F1-05.                                                 SQ2184.2
059500     MOVE "ERROR READING SHORT;VII-13 SR (2), GR (1,2)" TO RE-MARKSQ2184.2
059600     PERFORM FAIL.                                                SQ2184.2
059700 READ-WRITE-F1-05.                                                SQ2184.2
059800     MOVE "READ SHORT RECORDS" TO FEATURE.                        SQ2184.2
059900     MOVE "READ-TEST-F1-05" TO PAR-NAME.                          SQ2184.2
060000     PERFORM PRINT-DETAIL.                                        SQ2184.2
060100 READ-INIT-F1-06.                                                 SQ2184.2
060200     READ SQ-VS6 RECORD END                                       SQ2184.2
060300         GO TO READ-TEST-F1-06.                                   SQ2184.2
060400     MOVE "MORE THAN 450 RECORDS" TO RE-MARK.                     SQ2184.2
060500     GO TO READ-FAIL-F1-06.                                       SQ2184.2
060600 READ-EOF-F1-06.                                                  SQ2184.2
060700     MOVE "RECORDS READ =" TO COMPUTED-A.                         SQ2184.2
060800     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          SQ2184.2
060900     GO TO READ-FAIL-F1-06.                                       SQ2184.2
061000 READ-TEST-F1-06.                                                 SQ2184.2
061100     IF RECORDS-IN-ERROR NOT EQUAL TO ZERO                        SQ2184.2
061200         MOVE "RECORDS IN ERROR =" TO COMPUTED-A                  SQ2184.2
061300         MOVE RECORDS-IN-ERROR TO CORRECT-18V0                    SQ2184.2
061400         GO TO READ-FAIL-F1-06.                                   SQ2184.2
061500 READ-PASS-F1-06.                                                 SQ2184.2
061600     PERFORM PASS.                                                SQ2184.2
061700     GO TO READ-WRITE-F1-06.                                      SQ2184.2
061800 READ-FAIL-F1-06.                                                 SQ2184.2
061900     MOVE "VII-13 SR (2), GR (1,2)" TO RE-MARK.                   SQ2184.2
062000     PERFORM FAIL.                                                SQ2184.2
062100 READ-WRITE-F1-06.                                                SQ2184.2
062200     MOVE "READ-TEST-F1-06" TO PAR-NAME.                          SQ2184.2
062300     MOVE "VERIFY FILE SQ-VS6" TO FEATURE.                        SQ2184.2
062400     PERFORM PRINT-DETAIL.                                        SQ2184.2
062500 READ-CLOSE-F1-06.                                                SQ2184.2
062600     CLOSE SQ-VS6.                                                SQ2184.2
062700 SECT-SQ218A-0002 SECTION.                                        SQ2184.2
062800*        THIS SECTION CHECKS IF THE ENTIRE RECORD AREA IS WRITTEN SQ2184.2
062900*    ON THE OUTPUT DEVICE WHEN A SHORT RECORD IS WRITTEN.  THE    SQ2184.2
063000*    RECORD NUMBER IN CHARACTERS 126 THROUGH 130 IS UNIQUE        SQ2184.2
063100*    FOR EACH RECORD.                                             SQ2184.2
063200 INFO-INIT-001.                                                   SQ2184.2
063300     OPEN INPUT SQ-VS6.                                           SQ2184.2
063400     MOVE ZERO TO COUNT-OF-RECS.                                  SQ2184.2
063500 INFO-TEST-001.                                                   SQ2184.2
063600     READ SQ-VS6 AT END                                           SQ2184.2
063700          GO TO INFO-END.                                         SQ2184.2
063800     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
063900     IF SQ-VS6-RECNO NOT EQUAL TO "00001"                         SQ2184.2
064000          GO TO NO-INFO-001.                                      SQ2184.2
064100     MOVE "MAXIMUM RECORD SIZE WRITTEN" TO RE-MARK.               SQ2184.2
064200     MOVE "RECORD READ =" TO COMPUTED-A.                          SQ2184.2
064300     MOVE 0001 TO CORRECT-18V0.                                   SQ2184.2
064400     GO TO INFO-WRITE-001.                                        SQ2184.2
064500 NO-INFO-001.                                                     SQ2184.2
064600     MOVE "NO DEFINITE CONCLUSION POSSIBLE" TO RE-MARK.           SQ2184.2
064700 INFO-WRITE-001.                                                  SQ2184.2
064800     MOVE "READ SHORT RECORD" TO FEATURE.                         SQ2184.2
064900     MOVE "INFO-TEST-001" TO PAR-NAME.                            SQ2184.2
065000     PERFORM PRINT-DETAIL.                                        SQ2184.2
065100 INFO-INIT-002.                                                   SQ2184.2
065200     READ SQ-VS6 RECORD AT END                                    SQ2184.2
065300          GO TO INFO-END.                                         SQ2184.2
065400     READ SQ-VS6 END                                              SQ2184.2
065500          GO TO INFO-END.                                         SQ2184.2
065600 INFO-TEST-002.                                                   SQ2184.2
065700     READ SQ-VS6 AT END                                           SQ2184.2
065800          GO TO INFO-END.                                         SQ2184.2
065900     IF SQ-VS6-RECNO NOT EQUAL TO "00004"                         SQ2184.2
066000          GO TO NO-INFO-002.                                      SQ2184.2
066100     MOVE "MAXIMUM RECORD SIZE WRITTEN" TO RE-MARK.               SQ2184.2
066200     MOVE "RECORD READ =" TO COMPUTED-A.                          SQ2184.2
066300     MOVE 0004 TO CORRECT-18V0.                                   SQ2184.2
066400     GO TO INFO-WRITE-002.                                        SQ2184.2
066500 NO-INFO-002.                                                     SQ2184.2
066600     MOVE "NO DEFINITE CONCLUSION POSSIBLE" TO RE-MARK.           SQ2184.2
066700 INFO-WRITE-002.                                                  SQ2184.2
066800     MOVE "READ SHORT RECORD" TO FEATURE.                         SQ2184.2
066900     MOVE "INFO-TEST-002" TO PAR-NAME.                            SQ2184.2
067000     PERFORM PRINT-DETAIL.                                        SQ2184.2
067100 INFO-INIT-003.                                                   SQ2184.2
067200     ADD 3 TO COUNT-OF-RECS.                                      SQ2184.2
067300 INFO-INIT-003-1.                                                 SQ2184.2
067400     READ SQ-VS6 RECORD                                           SQ2184.2
067500          END GO TO INFO-END.                                     SQ2184.2
067600     ADD 1 TO COUNT-OF-RECS.                                      SQ2184.2
067700     IF COUNT-OF-RECS EQUAL TO 450                                SQ2184.2
067800         GO TO INFO-TEST-003.                                     SQ2184.2
067900     GO TO INFO-INIT-003-1.                                       SQ2184.2
068000 INFO-TEST-003.                                                   SQ2184.2
068100     IF SQ-VS6-RECNO NOT EQUAL TO "00450"                         SQ2184.2
068200          GO TO NO-INFO-003.                                      SQ2184.2
068300     MOVE "MAXIMUM RECORD SIZE WRITTEN" TO RE-MARK.               SQ2184.2
068400     MOVE "RECORD READ =" TO COMPUTED-A.                          SQ2184.2
068500     MOVE 0450 TO CORRECT-18V0.                                   SQ2184.2
068600     GO TO INFO-WRITE-003.                                        SQ2184.2
068700 NO-INFO-003.                                                     SQ2184.2
068800     MOVE "NO DEFINITE CONCLUSION POSSIBLE" TO RE-MARK.           SQ2184.2
068900 INFO-WRITE-003.                                                  SQ2184.2
069000     MOVE "READ SHORT RECORD" TO FEATURE.                         SQ2184.2
069100     MOVE "INFO-TEST-003" TO PAR-NAME.                            SQ2184.2
069200     PERFORM PRINT-DETAIL.                                        SQ2184.2
069300 INFO-END.                                                        SQ2184.2
069400     CLOSE SQ-VS6.                                                SQ2184.2
069500 TERMINATE-ROUTINE.                                               SQ2184.2
069600     EXIT.                                                        SQ2184.2
069700 CCVS-EXIT SECTION.                                               SQ2184.2
069800 CCVS-999999.                                                     SQ2184.2
069900     GO TO CLOSE-FILES.                                           SQ2184.2
