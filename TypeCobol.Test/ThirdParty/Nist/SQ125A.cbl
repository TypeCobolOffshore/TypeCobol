000100 IDENTIFICATION DIVISION.                                         SQ1254.2
000200 PROGRAM-ID.                                                      SQ1254.2
000300     SQ125A.                                                      SQ1254.2
000400****************************************************************  SQ1254.2
000500*                                                              *  SQ1254.2
000600*    VALIDATION FOR:-                                          *  SQ1254.2
000700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SQ1254.2
000800*    USING CCVS85 VERSION 3.0                                  *  SQ1254.2
000900*                             REVISED 1986, AUGUST             *  SQ1254.2
001000*                                                              *  SQ1254.2
001100*    CREATION DATE     /     VALIDATION DATE                   *  SQ1254.2
001200*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SQ1254.2
001300*                                                              *  SQ1254.2
001400****************************************************************  SQ1254.2
001500*                                                              *  SQ1254.2
001600*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  SQ1254.2
001700*                                                              *  SQ1254.2
001800*            X-01   SEQUENTIAL MAGNETIC TAPE FILE.             *  SQ1254.2
001900*            X-55   SYSTEM PRINTER                             *  SQ1254.2
002000*            X-82   SOURCE-COMPUTER                            *  SQ1254.2
002100*            X-83   OBJECT-COMPUTER                            *  SQ1254.2
002200*            X-84   LABEL RECORDS OPTION                       *  SQ1254.2
002300*                                                              *  SQ1254.2
002400*                                                              *  SQ1254.2
002500****************************************************************  SQ1254.2
002600*                                                              *  SQ1254.2
002700*    SQ125A ATTEMPTS TO OPEN FOR OUTPUT A MAGNETIC TAPE FILE   *  SQ1254.2
002800*    WHICH IS ALREADY OPEN IN THE OUTPUT MODE.  THIS SHOULD    *  SQ1254.2
002900*    RESULT IN A RECOGNITION OF A LOGIC ERROR CONDITION AND AN *  SQ1254.2
003000*    I-O STATUS OF "41".  THE PROGRAM CONTAINS AN APPLICABLE   *  SQ1254.2
003100*    DECLARATIVE PROCEDURE, WHICH SHOULD BE IMPLEMENTED.       *  SQ1254.2
003200*                                                              *  SQ1254.2
003300****************************************************************  SQ1254.2
003400*                                                                 SQ1254.2
003500 ENVIRONMENT DIVISION.                                            SQ1254.2
003600 CONFIGURATION SECTION.                                           SQ1254.2
003700 SOURCE-COMPUTER.                                                 SQ1254.2
003800     XXXXX082.                                                    SQ1254.2
003900 OBJECT-COMPUTER.                                                 SQ1254.2
004000     XXXXX083.                                                    SQ1254.2
004100*                                                                 SQ1254.2
004200 INPUT-OUTPUT SECTION.                                            SQ1254.2
004300 FILE-CONTROL.                                                    SQ1254.2
004400     SELECT PRINT-FILE ASSIGN TO                                  SQ1254.2
004500     XXXXX055.                                                    SQ1254.2
004600*                                                                 SQ1254.2
004700     SELECT SQ-FS1 ASSIGN TO                                      SQ1254.2
004800     XXXXX001                                                     SQ1254.2
004900            FILE STATUS IS SQ-FS1-STATUS.                         SQ1254.2
005000*                                                                 SQ1254.2
005100*                                                                 SQ1254.2
005200 DATA DIVISION.                                                   SQ1254.2
005300 FILE SECTION.                                                    SQ1254.2
005400 FD  PRINT-FILE                                                   SQ1254.2
005500     LABEL RECORDS                                                SQ1254.2
005600     XXXXX084                                                     SQ1254.2
005700     DATA RECORD IS PRINT-REC DUMMY-RECORD                        SQ1254.2
005800               .                                                  SQ1254.2
005900 01  PRINT-REC    PICTURE X(120).                                 SQ1254.2
006000 01  DUMMY-RECORD PICTURE X(120).                                 SQ1254.2
006100*                                                                 SQ1254.2
006200 FD  SQ-FS1                                                       SQ1254.2
006300     LABEL RECORD IS STANDARD                                     SQ1254.2
006400                .                                                 SQ1254.2
006500 01  SQ-FS1R1-F-G-120 PIC X(120).                                 SQ1254.2
006600*                                                                 SQ1254.2
006700 WORKING-STORAGE SECTION.                                         SQ1254.2
006800*                                                                 SQ1254.2
006900***************************************************************   SQ1254.2
007000*                                                             *   SQ1254.2
007100*    WORKING-STORAGE DATA ITEMS SPECIFIC TO THIS TEST SUITE   *   SQ1254.2
007200*                                                             *   SQ1254.2
007300***************************************************************   SQ1254.2
007400*                                                                 SQ1254.2
007500 01  SQ-FS1-STATUS.                                               SQ1254.2
007600   03  SQ-FS1-KEY-1   PIC X.                                      SQ1254.2
007700   03  SQ-FS1-KEY-2   PIC X.                                      SQ1254.2
007800*                                                                 SQ1254.2
007900***************************************************************   SQ1254.2
008000*                                                             *   SQ1254.2
008100*    WORKING-STORAGE DATA ITEMS USED BY THE CCVS              *   SQ1254.2
008200*                                                             *   SQ1254.2
008300***************************************************************   SQ1254.2
008400*                                                                 SQ1254.2
008500 01  REC-SKEL-SUB   PIC 99.                                       SQ1254.2
008600*                                                                 SQ1254.2
008700 01  FILE-RECORD-INFORMATION-REC.                                 SQ1254.2
008800     03 FILE-RECORD-INFO-SKELETON.                                SQ1254.2
008900        05 FILLER                 PICTURE X(48)       VALUE       SQ1254.2
009000             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  SQ1254.2
009100        05 FILLER                 PICTURE X(46)       VALUE       SQ1254.2
009200             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    SQ1254.2
009300        05 FILLER                 PICTURE X(26)       VALUE       SQ1254.2
009400             ",LFIL=000000,ORG=  ,LBLR= ".                        SQ1254.2
009500        05 FILLER                 PICTURE X(37)       VALUE       SQ1254.2
009600             ",RECKEY=                             ".             SQ1254.2
009700        05 FILLER                 PICTURE X(38)       VALUE       SQ1254.2
009800             ",ALTKEY1=                             ".            SQ1254.2
009900        05 FILLER                 PICTURE X(38)       VALUE       SQ1254.2
010000             ",ALTKEY2=                             ".            SQ1254.2
010100        05 FILLER                 PICTURE X(7)        VALUE SPACE.SQ1254.2
010200     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              SQ1254.2
010300        05 FILE-RECORD-INFO-P1-120.                               SQ1254.2
010400           07 FILLER              PIC X(5).                       SQ1254.2
010500           07 XFILE-NAME          PIC X(6).                       SQ1254.2
010600           07 FILLER              PIC X(8).                       SQ1254.2
010700           07 XRECORD-NAME        PIC X(6).                       SQ1254.2
010800           07 FILLER              PIC X(1).                       SQ1254.2
010900           07 REELUNIT-NUMBER     PIC 9(1).                       SQ1254.2
011000           07 FILLER              PIC X(7).                       SQ1254.2
011100           07 XRECORD-NUMBER      PIC 9(6).                       SQ1254.2
011200           07 FILLER              PIC X(6).                       SQ1254.2
011300           07 UPDATE-NUMBER       PIC 9(2).                       SQ1254.2
011400           07 FILLER              PIC X(5).                       SQ1254.2
011500           07 ODO-NUMBER          PIC 9(4).                       SQ1254.2
011600           07 FILLER              PIC X(5).                       SQ1254.2
011700           07 XPROGRAM-NAME       PIC X(5).                       SQ1254.2
011800           07 FILLER              PIC X(7).                       SQ1254.2
011900           07 XRECORD-LENGTH      PIC 9(6).                       SQ1254.2
012000           07 FILLER              PIC X(7).                       SQ1254.2
012100           07 CHARS-OR-RECORDS    PIC X(2).                       SQ1254.2
012200           07 FILLER              PIC X(1).                       SQ1254.2
012300           07 XBLOCK-SIZE         PIC 9(4).                       SQ1254.2
012400           07 FILLER              PIC X(6).                       SQ1254.2
012500           07 RECORDS-IN-FILE     PIC 9(6).                       SQ1254.2
012600           07 FILLER              PIC X(5).                       SQ1254.2
012700           07 XFILE-ORGANIZATION  PIC X(2).                       SQ1254.2
012800           07 FILLER              PIC X(6).                       SQ1254.2
012900           07 XLABEL-TYPE         PIC X(1).                       SQ1254.2
013000        05 FILE-RECORD-INFO-P121-240.                             SQ1254.2
013100           07 FILLER              PIC X(8).                       SQ1254.2
013200           07 XRECORD-KEY         PIC X(29).                      SQ1254.2
013300           07 FILLER              PIC X(9).                       SQ1254.2
013400           07 ALTERNATE-KEY1      PIC X(29).                      SQ1254.2
013500           07 FILLER              PIC X(9).                       SQ1254.2
013600           07 ALTERNATE-KEY2      PIC X(29).                      SQ1254.2
013700           07 FILLER              PIC X(7).                       SQ1254.2
013800*                                                                 SQ1254.2
013900 01  TEST-RESULTS.                                                SQ1254.2
014000     02 FILLER              PIC X      VALUE SPACE.               SQ1254.2
014100     02  PAR-NAME.                                                SQ1254.2
014200       03 FILLER              PIC X(14)  VALUE SPACE.             SQ1254.2
014300       03 PARDOT-X            PIC X      VALUE SPACE.             SQ1254.2
014400       03 DOTVALUE            PIC 99     VALUE ZERO.              SQ1254.2
014500     02 FILLER              PIC X      VALUE SPACE.               SQ1254.2
014600     02 FEATURE             PIC X(24)  VALUE SPACE.               SQ1254.2
014700     02 FILLER              PIC X      VALUE SPACE.               SQ1254.2
014800     02 P-OR-F              PIC X(5)   VALUE SPACE.               SQ1254.2
014900     02 FILLER              PIC X(9)   VALUE SPACE.               SQ1254.2
015000     02 RE-MARK             PIC X(61).                            SQ1254.2
015100 01  TEST-COMPUTED.                                               SQ1254.2
015200   02 FILLER  PIC X(30)  VALUE SPACE.                             SQ1254.2
015300   02 FILLER  PIC X(17)  VALUE "      COMPUTED =".                SQ1254.2
015400   02 COMPUTED-X.                                                 SQ1254.2
015500     03 COMPUTED-A    PIC X(20)  VALUE SPACE.                     SQ1254.2
015600     03 COMPUTED-N    REDEFINES COMPUTED-A PIC -9(9).9(9).        SQ1254.2
015700     03 COMPUTED-0V18 REDEFINES COMPUTED-A PIC -.9(18).           SQ1254.2
015800     03 COMPUTED-4V14 REDEFINES COMPUTED-A PIC -9(4).9(14).       SQ1254.2
015900     03 COMPUTED-14V4 REDEFINES COMPUTED-A PIC -9(14).9(4).       SQ1254.2
016000     03       CM-18V0 REDEFINES COMPUTED-A.                       SQ1254.2
016100        04 COMPUTED-18V0                   PIC -9(18).            SQ1254.2
016200        04 FILLER                          PIC X.                 SQ1254.2
016300     03 FILLER PIC X(50) VALUE SPACE.                             SQ1254.2
016400 01  TEST-CORRECT.                                                SQ1254.2
016500     02 FILLER PIC X(30) VALUE SPACE.                             SQ1254.2
016600     02 FILLER PIC X(17) VALUE "       CORRECT =".                SQ1254.2
016700     02 CORRECT-X.                                                SQ1254.2
016800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         SQ1254.2
016900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      SQ1254.2
017000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         SQ1254.2
017100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     SQ1254.2
017200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     SQ1254.2
017300     03      CR-18V0 REDEFINES CORRECT-A.                         SQ1254.2
017400         04 CORRECT-18V0                     PIC -9(18).          SQ1254.2
017500         04 FILLER                           PIC X.               SQ1254.2
017600     03 FILLER PIC X(2) VALUE SPACE.                              SQ1254.2
017700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     SQ1254.2
017800*                                                                 SQ1254.2
017900 01  CCVS-C-1.                                                    SQ1254.2
018000     02 FILLER  PIC IS X        VALUE  SPACE.                     SQ1254.2
018100     02 FILLER  PIC IS X(17)    VALUE "PARAGRAPH-NAME".           SQ1254.2
018200     02 FILLER  PIC IS X        VALUE  SPACE.                     SQ1254.2
018300     02 FILLER  PIC IS X(24)    VALUE IS "FEATURE".               SQ1254.2
018400     02 FILLER  PIC IS X        VALUE  SPACE.                     SQ1254.2
018500     02 FILLER  PIC IS X(5)     VALUE "PASS ".                    SQ1254.2
018600     02 FILLER  PIC IS X(9)     VALUE  SPACE.                     SQ1254.2
018700     02 FILLER  PIC IS X(62)    VALUE "REMARKS".                  SQ1254.2
018800 01  CCVS-C-2.                                                    SQ1254.2
018900     02 FILLER  PIC X(19)  VALUE  SPACE.                          SQ1254.2
019000     02 FILLER  PIC X(6)   VALUE "TESTED".                        SQ1254.2
019100     02 FILLER  PIC X(19)  VALUE  SPACE.                          SQ1254.2
019200     02 FILLER  PIC X(4)   VALUE "FAIL".                          SQ1254.2
019300     02 FILLER  PIC X(72)  VALUE  SPACE.                          SQ1254.2
019400*                                                                 SQ1254.2
019500 01  REC-SKL-SUB       PIC 9(2)     VALUE ZERO.                   SQ1254.2
019600 01  REC-CT            PIC 99       VALUE ZERO.                   SQ1254.2
019700 01  DELETE-COUNTER    PIC 999      VALUE ZERO.                   SQ1254.2
019800 01  ERROR-COUNTER     PIC 999      VALUE ZERO.                   SQ1254.2
019900 01  INSPECT-COUNTER   PIC 999      VALUE ZERO.                   SQ1254.2
020000 01  PASS-COUNTER      PIC 999      VALUE ZERO.                   SQ1254.2
020100 01  TOTAL-ERROR       PIC 999      VALUE ZERO.                   SQ1254.2
020200 01  ERROR-HOLD        PIC 999      VALUE ZERO.                   SQ1254.2
020300 01  DUMMY-HOLD        PIC X(120)   VALUE SPACE.                  SQ1254.2
020400 01  RECORD-COUNT      PIC 9(5)     VALUE ZERO.                   SQ1254.2
020500 01  ANSI-REFERENCE    PIC X(48)    VALUE SPACES.                 SQ1254.2
020600 01  CCVS-H-1.                                                    SQ1254.2
020700     02  FILLER          PIC X(39)    VALUE SPACES.               SQ1254.2
020800     02  FILLER          PIC X(42)    VALUE                       SQ1254.2
020900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 SQ1254.2
021000     02  FILLER          PIC X(39)    VALUE SPACES.               SQ1254.2
021100 01  CCVS-H-2A.                                                   SQ1254.2
021200   02  FILLER            PIC X(40)  VALUE SPACE.                  SQ1254.2
021300   02  FILLER            PIC X(7)   VALUE "CCVS85 ".              SQ1254.2
021400   02  FILLER            PIC XXXX   VALUE                         SQ1254.2
021500     "4.2 ".                                                      SQ1254.2
021600   02  FILLER            PIC X(28)  VALUE                         SQ1254.2
021700            " COPY - NOT FOR DISTRIBUTION".                       SQ1254.2
021800   02  FILLER            PIC X(41)  VALUE SPACE.                  SQ1254.2
021900*                                                                 SQ1254.2
022000 01  CCVS-H-2B.                                                   SQ1254.2
022100   02  FILLER            PIC X(15)  VALUE "TEST RESULT OF ".      SQ1254.2
022200   02  TEST-ID           PIC X(9).                                SQ1254.2
022300   02  FILLER            PIC X(4)   VALUE " IN ".                 SQ1254.2
022400   02  FILLER            PIC X(12)  VALUE                         SQ1254.2
022500     " HIGH       ".                                              SQ1254.2
022600   02  FILLER            PIC X(22)  VALUE                         SQ1254.2
022700            " LEVEL VALIDATION FOR ".                             SQ1254.2
022800   02  FILLER            PIC X(58)  VALUE                         SQ1254.2
022900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SQ1254.2
023000 01  CCVS-H-3.                                                    SQ1254.2
023100     02  FILLER          PIC X(34)  VALUE                         SQ1254.2
023200            " FOR OFFICIAL USE ONLY    ".                         SQ1254.2
023300     02  FILLER          PIC X(58)  VALUE                         SQ1254.2
023400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SQ1254.2
023500     02  FILLER          PIC X(28)  VALUE                         SQ1254.2
023600            "  COPYRIGHT   1985,1986 ".                           SQ1254.2
023700 01  CCVS-E-1.                                                    SQ1254.2
023800     02 FILLER           PIC X(52)  VALUE SPACE.                  SQ1254.2
023900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              SQ1254.2
024000     02 ID-AGAIN         PIC X(9).                                SQ1254.2
024100     02 FILLER           PIC X(45)  VALUE SPACES.                 SQ1254.2
024200 01  CCVS-E-2.                                                    SQ1254.2
024300     02  FILLER          PIC X(31)  VALUE SPACE.                  SQ1254.2
024400     02  FILLER          PIC X(21)  VALUE SPACE.                  SQ1254.2
024500     02  CCVS-E-2-2.                                              SQ1254.2
024600         03 ERROR-TOTAL    PIC XXX    VALUE SPACE.                SQ1254.2
024700         03 FILLER         PIC X      VALUE SPACE.                SQ1254.2
024800         03 ENDER-DESC     PIC X(44)  VALUE                       SQ1254.2
024900            "ERRORS ENCOUNTERED".                                 SQ1254.2
025000 01  CCVS-E-3.                                                    SQ1254.2
025100     02  FILLER          PIC X(22)  VALUE                         SQ1254.2
025200            " FOR OFFICIAL USE ONLY".                             SQ1254.2
025300     02  FILLER          PIC X(12)  VALUE SPACE.                  SQ1254.2
025400     02  FILLER          PIC X(58)  VALUE                         SQ1254.2
025500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SQ1254.2
025600     02  FILLER          PIC X(8)   VALUE SPACE.                  SQ1254.2
025700     02  FILLER          PIC X(20)  VALUE                         SQ1254.2
025800             " COPYRIGHT 1985,1986".                              SQ1254.2
025900 01  CCVS-E-4.                                                    SQ1254.2
026000     02 CCVS-E-4-1       PIC XXX    VALUE SPACE.                  SQ1254.2
026100     02 FILLER           PIC X(4)   VALUE " OF ".                 SQ1254.2
026200     02 CCVS-E-4-2       PIC XXX    VALUE SPACE.                  SQ1254.2
026300     02 FILLER           PIC X(40)  VALUE                         SQ1254.2
026400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       SQ1254.2
026500 01  XXINFO.                                                      SQ1254.2
026600     02 FILLER           PIC X(19)  VALUE "*** INFORMATION ***".  SQ1254.2
026700     02 INFO-TEXT.                                                SQ1254.2
026800       04 FILLER             PIC X(8)   VALUE SPACE.              SQ1254.2
026900       04 XXCOMPUTED         PIC X(20).                           SQ1254.2
027000       04 FILLER             PIC X(5)   VALUE SPACE.              SQ1254.2
027100       04 XXCORRECT          PIC X(20).                           SQ1254.2
027200     02 INF-ANSI-REFERENCE PIC X(48).                             SQ1254.2
027300 01  HYPHEN-LINE.                                                 SQ1254.2
027400     02 FILLER  PIC IS X VALUE IS SPACE.                          SQ1254.2
027500     02 FILLER  PIC IS X(65)    VALUE IS "************************SQ1254.2
027600-    "*****************************************".                 SQ1254.2
027700     02 FILLER  PIC IS X(54)    VALUE IS "************************SQ1254.2
027800-    "******************************".                            SQ1254.2
027900 01  CCVS-PGM-ID  PIC X(9)   VALUE                                SQ1254.2
028000     "SQ125A".                                                    SQ1254.2
028100*                                                                 SQ1254.2
028200*                                                                 SQ1254.2
028300 PROCEDURE DIVISION.                                              SQ1254.2
028400 DECLARATIVES.                                                    SQ1254.2
028500 SQ125A-DECLARATIVE-001-SECT SECTION.                             SQ1254.2
028600     USE AFTER STANDARD EXCEPTION PROCEDURE SQ-FS1.               SQ1254.2
028700 INPUT-ERROR-PROCEDURE.                                           SQ1254.2
028800     IF SQ-FS1-STATUS = "41"                                      SQ1254.2
028900             PERFORM DECL-PASS                                    SQ1254.2
029000             GO TO ABNORMAL-TERM-DECL                             SQ1254.2
029100     ELSE                                                         SQ1254.2
029200             MOVE "41" TO CORRECT-A                               SQ1254.2
029300             MOVE SQ-FS1-STATUS TO COMPUTED-A                     SQ1254.2
029400             MOVE "INCORRECT I-O STATUS FOR SECOND OPEN"          SQ1254.2
029500                     TO RE-MARK                                   SQ1254.2
029600             PERFORM DECL-FAIL                                    SQ1254.2
029700             GO TO ABNORMAL-TERM-DECL                             SQ1254.2
029800     END-IF.                                                      SQ1254.2
029900*                                                                 SQ1254.2
030000*                                                                 SQ1254.2
030100 DECL-PASS.                                                       SQ1254.2
030200     MOVE   "PASS " TO P-OR-F.                                    SQ1254.2
030300     ADD     1 TO PASS-COUNTER.                                   SQ1254.2
030400     PERFORM DECL-PRINT-DETAIL.                                   SQ1254.2
030500*                                                                 SQ1254.2
030600 DECL-FAIL.                                                       SQ1254.2
030700     MOVE   "FAIL*" TO P-OR-F.                                    SQ1254.2
030800     ADD     1 TO ERROR-COUNTER.                                  SQ1254.2
030900     PERFORM DECL-PRINT-DETAIL.                                   SQ1254.2
031000*                                                                 SQ1254.2
031100 DECL-PRINT-DETAIL.                                               SQ1254.2
031200     IF REC-CT NOT EQUAL TO ZERO                                  SQ1254.2
031300             MOVE "." TO PARDOT-X                                 SQ1254.2
031400             MOVE REC-CT TO DOTVALUE.                             SQ1254.2
031500     MOVE    TEST-RESULTS TO PRINT-REC.                           SQ1254.2
031600     PERFORM DECL-WRITE-LINE.                                     SQ1254.2
031700     IF P-OR-F EQUAL TO "FAIL*"                                   SQ1254.2
031800         PERFORM DECL-WRITE-LINE                                  SQ1254.2
031900         PERFORM DECL-FAIL-ROUTINE THRU DECL-FAIL-EX              SQ1254.2
032000     ELSE                                                         SQ1254.2
032100         PERFORM DECL-BAIL THRU DECL-BAIL-EX.                     SQ1254.2
032200     MOVE    SPACE TO P-OR-F.                                     SQ1254.2
032300     MOVE    SPACE TO COMPUTED-X.                                 SQ1254.2
032400     MOVE    SPACE TO CORRECT-X.                                  SQ1254.2
032500     IF REC-CT EQUAL TO ZERO                                      SQ1254.2
032600         MOVE    SPACE TO PAR-NAME.                               SQ1254.2
032700     MOVE    SPACE TO RE-MARK.                                    SQ1254.2
032800*                                                                 SQ1254.2
032900 DECL-WRITE-LINE.                                                 SQ1254.2
033000     ADD     1 TO RECORD-COUNT.                                   SQ1254.2
033100     IF RECORD-COUNT GREATER 50                                   SQ1254.2
033200         MOVE    DUMMY-RECORD TO DUMMY-HOLD                       SQ1254.2
033300         MOVE    SPACE TO DUMMY-RECORD                            SQ1254.2
033400         WRITE   DUMMY-RECORD AFTER ADVANCING PAGE                SQ1254.2
033500         MOVE    CCVS-C-1 TO DUMMY-RECORD PERFORM DECL-WRT-LN     SQ1254.2
033600         MOVE    CCVS-C-2 TO DUMMY-RECORD                         SQ1254.2
033700         PERFORM DECL-WRT-LN 2 TIMES                              SQ1254.2
033800         MOVE    HYPHEN-LINE TO DUMMY-RECORD                      SQ1254.2
033900         PERFORM DECL-WRT-LN                                      SQ1254.2
034000         MOVE    DUMMY-HOLD TO DUMMY-RECORD                       SQ1254.2
034100         MOVE    ZERO TO RECORD-COUNT.                            SQ1254.2
034200     PERFORM DECL-WRT-LN.                                         SQ1254.2
034300*                                                                 SQ1254.2
034400 DECL-WRT-LN.                                                     SQ1254.2
034500     WRITE   DUMMY-RECORD AFTER ADVANCING 1 LINES.                SQ1254.2
034600     MOVE    SPACE TO DUMMY-RECORD.                               SQ1254.2
034700*                                                                 SQ1254.2
034800 DECL-FAIL-ROUTINE.                                               SQ1254.2
034900     IF COMPUTED-X NOT EQUAL TO SPACE GO TO DECL-FAIL-WRITE.      SQ1254.2
035000     IF CORRECT-X NOT EQUAL TO SPACE GO TO DECL-FAIL-WRITE.       SQ1254.2
035100     MOVE    ANSI-REFERENCE TO INF-ANSI-REFERENCE.                SQ1254.2
035200     MOVE   "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.  SQ1254.2
035300     MOVE    XXINFO TO DUMMY-RECORD.                              SQ1254.2
035400     PERFORM DECL-WRITE-LINE 2 TIMES.                             SQ1254.2
035500     MOVE    SPACES TO INF-ANSI-REFERENCE.                        SQ1254.2
035600     GO TO   DECL-FAIL-EX.                                        SQ1254.2
035700 DECL-FAIL-WRITE.                                                 SQ1254.2
035800     MOVE    TEST-COMPUTED TO PRINT-REC                           SQ1254.2
035900     PERFORM DECL-WRITE-LINE                                      SQ1254.2
036000     MOVE    ANSI-REFERENCE TO COR-ANSI-REFERENCE.                SQ1254.2
036100     MOVE    TEST-CORRECT TO PRINT-REC                            SQ1254.2
036200     PERFORM DECL-WRITE-LINE 2 TIMES.                             SQ1254.2
036300     MOVE    SPACES TO COR-ANSI-REFERENCE.                        SQ1254.2
036400 DECL-FAIL-EX.                                                    SQ1254.2
036500     EXIT.                                                        SQ1254.2
036600*                                                                 SQ1254.2
036700 DECL-BAIL.                                                       SQ1254.2
036800     IF COMPUTED-A NOT EQUAL TO SPACE GO TO DECL-BAIL-WRITE.      SQ1254.2
036900     IF CORRECT-A EQUAL TO SPACE GO TO DECL-BAIL-EX.              SQ1254.2
037000 DECL-BAIL-WRITE.                                                 SQ1254.2
037100     MOVE    CORRECT-A TO XXCORRECT.                              SQ1254.2
037200     MOVE    COMPUTED-A TO XXCOMPUTED.                            SQ1254.2
037300     MOVE    XXINFO TO DUMMY-RECORD.                              SQ1254.2
037400     PERFORM DECL-WRITE-LINE 2 TIMES.                             SQ1254.2
037500 DECL-BAIL-EX.                                                    SQ1254.2
037600     EXIT.                                                        SQ1254.2
037700*                                                                 SQ1254.2
037800 ABNORMAL-TERM-DECL.                                              SQ1254.2
037900     MOVE SPACE TO DUMMY-RECORD.                                  SQ1254.2
038000     PERFORM DECL-WRITE-LINE.                                     SQ1254.2
038100     MOVE "ABNORMAL TERMINATION AT THIS POINT IS ACCEPTABLE"      SQ1254.2
038200             TO DUMMY-RECORD.                                     SQ1254.2
038300     PERFORM DECL-WRITE-LINE 3 TIMES.                             SQ1254.2
038400*                                                                 SQ1254.2
038500*                                                                 SQ1254.2
038600 END-DECLS.                                                       SQ1254.2
038700 END DECLARATIVES.                                                SQ1254.2
038800*                                                                 SQ1254.2
038900*                                                                 SQ1254.2
039000 CCVS1 SECTION.                                                   SQ1254.2
039100 OPEN-FILES.                                                      SQ1254.2
039200     OPEN    OUTPUT PRINT-FILE.                                   SQ1254.2
039300     MOVE    CCVS-PGM-ID TO TEST-ID.                              SQ1254.2
039400     MOVE    CCVS-PGM-ID TO ID-AGAIN.                             SQ1254.2
039500     MOVE    SPACE TO TEST-RESULTS.                               SQ1254.2
039600     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              SQ1254.2
039700     MOVE    ZERO TO REC-SKEL-SUB.                                SQ1254.2
039800     PERFORM CCVS-INIT-FILE 10 TIMES.                             SQ1254.2
039900     GO TO CCVS1-EXIT.                                            SQ1254.2
040000*                                                                 SQ1254.2
040100 CCVS-INIT-FILE.                                                  SQ1254.2
040200     ADD     1 TO REC-SKL-SUB.                                    SQ1254.2
040300     MOVE    FILE-RECORD-INFO-SKELETON TO                         SQ1254.2
040400                  FILE-RECORD-INFO (REC-SKL-SUB).                 SQ1254.2
040500*                                                                 SQ1254.2
040600 CLOSE-FILES.                                                     SQ1254.2
040700     PERFORM END-ROUTINE THRU END-ROUTINE-13.                     SQ1254.2
040800     CLOSE   PRINT-FILE.                                          SQ1254.2
040900 TERMINATE-CCVS.                                                  SQ1254.2
041000     STOP    RUN.                                                 SQ1254.2
041100*                                                                 SQ1254.2
041200 INSPT.                                                           SQ1254.2
041300     MOVE   "INSPT" TO P-OR-F.                                    SQ1254.2
041400     ADD     1 TO INSPECT-COUNTER.                                SQ1254.2
041500     PERFORM PRINT-DETAIL.                                        SQ1254.2
041600                                                                  SQ1254.2
041700 PASS.                                                            SQ1254.2
041800     MOVE   "PASS " TO P-OR-F.                                    SQ1254.2
041900     ADD     1 TO PASS-COUNTER.                                   SQ1254.2
042000     PERFORM PRINT-DETAIL.                                        SQ1254.2
042100*                                                                 SQ1254.2
042200 FAIL.                                                            SQ1254.2
042300     MOVE   "FAIL*" TO P-OR-F.                                    SQ1254.2
042400     ADD     1 TO ERROR-COUNTER.                                  SQ1254.2
042500     PERFORM PRINT-DETAIL.                                        SQ1254.2
042600*                                                                 SQ1254.2
042700 DE-LETE.                                                         SQ1254.2
042800     MOVE   "****TEST DELETED****" TO RE-MARK.                    SQ1254.2
042900     MOVE   "*****" TO P-OR-F.                                    SQ1254.2
043000     ADD     1 TO DELETE-COUNTER.                                 SQ1254.2
043100     PERFORM PRINT-DETAIL.                                        SQ1254.2
043200*                                                                 SQ1254.2
043300 PRINT-DETAIL.                                                    SQ1254.2
043400     IF REC-CT NOT EQUAL TO ZERO                                  SQ1254.2
043500         MOVE   "." TO PARDOT-X                                   SQ1254.2
043600         MOVE    REC-CT TO DOTVALUE.                              SQ1254.2
043700     MOVE    TEST-RESULTS TO PRINT-REC.                           SQ1254.2
043800     PERFORM WRITE-LINE.                                          SQ1254.2
043900     IF P-OR-F EQUAL TO "FAIL*"                                   SQ1254.2
044000         PERFORM WRITE-LINE                                       SQ1254.2
044100         PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                SQ1254.2
044200     ELSE                                                         SQ1254.2
044300         PERFORM BAIL-OUT THRU BAIL-OUT-EX.                       SQ1254.2
044400     MOVE    SPACE TO P-OR-F.                                     SQ1254.2
044500     MOVE    SPACE TO COMPUTED-X.                                 SQ1254.2
044600     MOVE    SPACE TO CORRECT-X.                                  SQ1254.2
044700     IF REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.             SQ1254.2
044800     MOVE    SPACE TO RE-MARK.                                    SQ1254.2
044900*                                                                 SQ1254.2
045000 HEAD-ROUTINE.                                                    SQ1254.2
045100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  SQ1254.2
045200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  SQ1254.2
045300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  SQ1254.2
045400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  SQ1254.2
045500 COLUMN-NAMES-ROUTINE.                                            SQ1254.2
045600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SQ1254.2
045700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SQ1254.2
045800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        SQ1254.2
045900 END-ROUTINE.                                                     SQ1254.2
046000     MOVE    HYPHEN-LINE TO DUMMY-RECORD.                         SQ1254.2
046100     PERFORM WRITE-LINE 5 TIMES.                                  SQ1254.2
046200 END-RTN-EXIT.                                                    SQ1254.2
046300     MOVE    CCVS-E-1 TO DUMMY-RECORD.                            SQ1254.2
046400     PERFORM WRITE-LINE 2 TIMES.                                  SQ1254.2
046500*                                                                 SQ1254.2
046600 END-ROUTINE-1.                                                   SQ1254.2
046700     ADD     ERROR-COUNTER   TO ERROR-HOLD                        SQ1254.2
046800     ADD     INSPECT-COUNTER TO ERROR-HOLD.                       SQ1254.2
046900     ADD     DELETE-COUNTER  TO ERROR-HOLD.                       SQ1254.2
047000     ADD     PASS-COUNTER    TO ERROR-HOLD.                       SQ1254.2
047100     MOVE    PASS-COUNTER    TO CCVS-E-4-1.                       SQ1254.2
047200     MOVE    ERROR-HOLD      TO CCVS-E-4-2.                       SQ1254.2
047300     MOVE    CCVS-E-4        TO CCVS-E-2-2.                       SQ1254.2
047400     MOVE    CCVS-E-2        TO DUMMY-RECORD                      SQ1254.2
047500     PERFORM WRITE-LINE.                                          SQ1254.2
047600     MOVE   "TEST(S) FAILED" TO ENDER-DESC.                       SQ1254.2
047700     IF ERROR-COUNTER IS EQUAL TO ZERO                            SQ1254.2
047800         MOVE   "NO " TO ERROR-TOTAL                              SQ1254.2
047900     ELSE                                                         SQ1254.2
048000         MOVE    ERROR-COUNTER TO ERROR-TOTAL.                    SQ1254.2
048100     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            SQ1254.2
048200     PERFORM WRITE-LINE.                                          SQ1254.2
048300 END-ROUTINE-13.                                                  SQ1254.2
048400     IF DELETE-COUNTER IS EQUAL TO ZERO                           SQ1254.2
048500         MOVE   "NO " TO ERROR-TOTAL                              SQ1254.2
048600     ELSE                                                         SQ1254.2
048700         MOVE    DELETE-COUNTER TO ERROR-TOTAL.                   SQ1254.2
048800     MOVE   "TEST(S) DELETED     " TO ENDER-DESC.                 SQ1254.2
048900     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            SQ1254.2
049000     PERFORM WRITE-LINE.                                          SQ1254.2
049100     IF INSPECT-COUNTER EQUAL TO ZERO                             SQ1254.2
049200         MOVE   "NO " TO ERROR-TOTAL                              SQ1254.2
049300     ELSE                                                         SQ1254.2
049400         MOVE    INSPECT-COUNTER TO ERROR-TOTAL.                  SQ1254.2
049500     MOVE   "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.           SQ1254.2
049600     MOVE    CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.        SQ1254.2
049700     MOVE    CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.        SQ1254.2
049800*                                                                 SQ1254.2
049900 WRITE-LINE.                                                      SQ1254.2
050000     ADD     1 TO RECORD-COUNT.                                   SQ1254.2
050100     IF RECORD-COUNT GREATER 50                                   SQ1254.2
050200         MOVE  DUMMY-RECORD TO DUMMY-HOLD                         SQ1254.2
050300         MOVE  SPACE TO DUMMY-RECORD                              SQ1254.2
050400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  SQ1254.2
050500         MOVE  CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN            SQ1254.2
050600         MOVE  CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    SQ1254.2
050700         MOVE  HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN         SQ1254.2
050800         MOVE  DUMMY-HOLD TO DUMMY-RECORD                         SQ1254.2
050900         MOVE  ZERO TO RECORD-COUNT.                              SQ1254.2
051000     PERFORM WRT-LN.                                              SQ1254.2
051100*                                                                 SQ1254.2
051200 WRT-LN.                                                          SQ1254.2
051300     WRITE   DUMMY-RECORD AFTER ADVANCING 1 LINES.                SQ1254.2
051400     MOVE    SPACE TO DUMMY-RECORD.                               SQ1254.2
051500 BLANK-LINE-PRINT.                                                SQ1254.2
051600     PERFORM WRT-LN.                                              SQ1254.2
051700 FAIL-ROUTINE.                                                    SQ1254.2
051800     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   SQ1254.2
051900     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    SQ1254.2
052000     MOVE    ANSI-REFERENCE TO INF-ANSI-REFERENCE.                SQ1254.2
052100     MOVE   "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.  SQ1254.2
052200     MOVE    XXINFO TO DUMMY-RECORD.                              SQ1254.2
052300     PERFORM WRITE-LINE 2 TIMES.                                  SQ1254.2
052400     MOVE    SPACES TO INF-ANSI-REFERENCE.                        SQ1254.2
052500     GO TO   FAIL-ROUTINE-EX.                                     SQ1254.2
052600 FAIL-ROUTINE-WRITE.                                              SQ1254.2
052700     MOVE    TEST-COMPUTED  TO PRINT-REC                          SQ1254.2
052800     PERFORM WRITE-LINE                                           SQ1254.2
052900     MOVE    ANSI-REFERENCE TO COR-ANSI-REFERENCE.                SQ1254.2
053000     MOVE    TEST-CORRECT   TO PRINT-REC                          SQ1254.2
053100     PERFORM WRITE-LINE 2 TIMES.                                  SQ1254.2
053200     MOVE    SPACES         TO COR-ANSI-REFERENCE.                SQ1254.2
053300 FAIL-ROUTINE-EX.                                                 SQ1254.2
053400     EXIT.                                                        SQ1254.2
053500 BAIL-OUT.                                                        SQ1254.2
053600     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       SQ1254.2
053700     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               SQ1254.2
053800 BAIL-OUT-WRITE.                                                  SQ1254.2
053900     MOVE    CORRECT-A      TO XXCORRECT.                         SQ1254.2
054000     MOVE    COMPUTED-A     TO XXCOMPUTED.                        SQ1254.2
054100     MOVE    ANSI-REFERENCE TO INF-ANSI-REFERENCE.                SQ1254.2
054200     MOVE    XXINFO TO DUMMY-RECORD.                              SQ1254.2
054300     PERFORM WRITE-LINE 2 TIMES.                                  SQ1254.2
054400     MOVE    SPACES TO INF-ANSI-REFERENCE.                        SQ1254.2
054500 BAIL-OUT-EX.                                                     SQ1254.2
054600     EXIT.                                                        SQ1254.2
054700 CCVS1-EXIT.                                                      SQ1254.2
054800     EXIT.                                                        SQ1254.2
054900*                                                                 SQ1254.2
055000****************************************************************  SQ1254.2
055100*                                                              *  SQ1254.2
055200*    THIS POINT MARKS THE END OF THE CCVS MONITOR ROUTINES AND *  SQ1254.2
055300*    THE START OF THE TESTS OF SPECIFIC COBOL FEATURES.        *  SQ1254.2
055400*                                                              *  SQ1254.2
055500****************************************************************  SQ1254.2
055600*                                                                 SQ1254.2
055700 SECT-SQ125A-MAIN SECTION.                                        SQ1254.2
055800*                                                                 SQ1254.2
055900*    THE FIRST ACTION IS TO CREATE THE FILE BY MEANS OF AN        SQ1254.2
056000*    OPEN OUTPUT STATEMENT.                                       SQ1254.2
056100*                                                                 SQ1254.2
056200 SEQ-INIT-01.                                                     SQ1254.2
056300*                                                                 SQ1254.2
056400     MOVE    1 TO REC-CT                                          SQ1254.2
056500     MOVE   "CREATE FILE, OPEN OUTPUT" TO FEATURE                 SQ1254.2
056600     MOVE   "SEQ-TEST-OP-01" TO PAR-NAME                          SQ1254.2
056700     MOVE   "**" TO SQ-FS1-STATUS.                                SQ1254.2
056800 SEQ-TEST-OP-01.                                                  SQ1254.2
056900     OPEN    OUTPUT SQ-FS1.                                       SQ1254.2
057000     MOVE   "SEQ-TEST-OP-01" TO PAR-NAME.                         SQ1254.2
057100     MOVE    1 TO REC-CT.                                         SQ1254.2
057200 SEQ-TEST-OP-01-01.                                               SQ1254.2
057300*                                                                 SQ1254.2
057400*    CHECK THE I-O STATUS VALUE RETURNED BY THE FIRST OPEN.       SQ1254.2
057500*                                                                 SQ1254.2
057600     IF  SQ-FS1-STATUS = "00"                                     SQ1254.2
057700         PERFORM PASS                                             SQ1254.2
057800     ELSE                                                         SQ1254.2
057900         MOVE    SQ-FS1-STATUS TO COMPUTED-A                      SQ1254.2
058000         MOVE   "00" TO CORRECT-A                                 SQ1254.2
058100         MOVE   "UNEXPECTED I-O STATUS CODE FROM OPEN OUTPUT"     SQ1254.2
058200                    TO RE-MARK                                    SQ1254.2
058300         MOVE   "VII-3, 1.5.3(1)A" TO ANSI-REFERENCE              SQ1254.2
058400         PERFORM FAIL.                                            SQ1254.2
058500 SEQ-TEST-01-01-END.                                              SQ1254.2
058600*                                                                 SQ1254.2
058700*                                                                 SQ1254.2
058800*    HAVING OPENED THE FILE, THE NEXT ACTION IS TO ATTEMPT        SQ1254.2
058900*    TO OPEN IT FOR OUTPUT AGAIN.                                 SQ1254.2
059000*                                                                 SQ1254.2
059100 SEQ-INIT-02.                                                     SQ1254.2
059200     MOVE    1 TO REC-CT                                          SQ1254.2
059300     MOVE   "OPEN OUTPUT ON OPEN FILE" TO FEATURE                 SQ1254.2
059400     MOVE   "SEQ-TEST-OP-02" TO PAR-NAME                          SQ1254.2
059500     MOVE   "**" TO SQ-FS1-STATUS.                                SQ1254.2
059600 SEQ-TEST-OP-02.                                                  SQ1254.2
059700     OPEN    OUTPUT SQ-FS1.                                       SQ1254.2
059800 CCVS-EXIT SECTION.                                               SQ1254.2
059900 CCVS-999999.                                                     SQ1254.2
060000     GO TO   CLOSE-FILES.                                         SQ1254.2
