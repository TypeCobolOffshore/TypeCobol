﻿       IDENTIFICATION DIVISION.
       PROGRAM-ID. Functions.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  x PIC 9.
       01  y PIC 9(3).
       01  z PIC 9(5).
       01  b TYPE BOOL.

       PROCEDURE DIVISION.
       
       DECLARE function POW PRIVATE
             INPUT x PIC 9(05)
                   y PIC 9(03)
             RETURNING result PIC 9(08)
         .
         PROCEDURE DIVISION.
           CONTINUE.
       END-DECLARE.

       TRAITEMENT.
           MOVE FUNCTION POW (x y)    TO x
           .

       END PROGRAM Functions.
