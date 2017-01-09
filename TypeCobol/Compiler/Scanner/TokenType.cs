﻿using System.Linq;

namespace TypeCobol.Compiler.Scanner
{
    // WARNING : both enumerations below (families / types) must stay in sync
    // WARNING : make sure to update the tables in TokenUtils if you add one more token family or one more token type

    public enum TokenFamily
    {
        //          0 : Error
        Invalid=0,
        //   1 ->   3 : Whitespace
        // p46: The separator comma and separator semicolon can
        // be used anywhere the separator space is used.
        Whitespace=1,
        //   4 ->   5 : Comments
        Comments=4,
        // 6 ->  11 : Separators - Syntax
        SyntaxSeparator=6,
        //  12 ->  16 : Special character word - Arithmetic operators
        ArithmeticOperator=12,
        //  17 ->  21 : Special character word - Relational operators
        RelationalOperator=17,
        //  22 ->  27 : Literals - Alphanumeric
        AlphanumericLiteral=22,
        //  28 ->  31 : Literals - Numeric 
        NumericLiteral=28,
        //  32 ->  34 : Literals - Syntax tokens
        SyntaxLiteral=32,
        //  35 ->  39 : Symbols
        Symbol=35,
        //  40 ->  58 : Keywords - Compiler directive starting tokens
        CompilerDirectiveStartingKeyword=40,
        //  59 ->  153 : Keywords - Code element starting tokens
        CodeElementStartingKeyword=59,
        // 154 -> 184 : Keywords - Special registers
        SpecialRegisterKeyword=154,
        // 185 -> 198 : Keywords - Figurative constants
        FigurativeConstantKeyword=185,
        // 199 -> 200 : Keywords - Special object identifiers
        SpecialObjetIdentifierKeyword=199,
        // 201 -> 452 : Keywords - Syntax tokens
        SyntaxKeyword=201,
        // 453 -> 454 : Keywords - Cobol 2002
        Cobol2002Keyword = 453,
        // 455 -> 458 : Keywords - TypeCobol
        TypeCobolKeyword = 455,
        // 459 -> 461 : Compiler directives
        CompilerDirective = 459,
        // 462 -> 462 : Internal token groups - used by the preprocessor only
        InternalTokenGroup = 462
    }

    // INFO : the list below is generated from the file Documentation/Studies/CobolLexer.tokens.xls
    // WARNING : the list of tokens in CobolWords.g4 must stay in sync

    public enum TokenType
    {
        EndOfFile = -1,
        // Error
        InvalidToken = 0,
        // Separators - Whitespace
        SpaceSeparator = 1,
        CommaSeparator = 2,
        SemicolonSeparator = 3,
        // Comments
        FloatingComment = 4,
        CommentLine = 5,
        // Separators - Syntax
        PeriodSeparator = 6,
        ColonSeparator = 7,
        QualifiedNameSeparator = 8,
        LeftParenthesisSeparator = 9,
        RightParenthesisSeparator = 10,
        PseudoTextDelimiter = 11,
        // Special character word - Arithmetic operators
        PlusOperator = 12,
        MinusOperator = 13,
        DivideOperator = 14,
        MultiplyOperator = 15,
        PowerOperator = 16,
        // Special character word - Relational operators
        LessThanOperator = 17,
        GreaterThanOperator = 18,
        LessThanOrEqualOperator = 19,
        GreaterThanOrEqualOperator = 20,
        EqualOperator = 21,
        // Literals - Alphanumeric
        AlphanumericLiteral = 22,
        HexadecimalAlphanumericLiteral = 23,
        NullTerminatedAlphanumericLiteral = 24,
        NationalLiteral = 25,
        HexadecimalNationalLiteral = 26,
        DBCSLiteral = 27,
        // Literals - Numeric
        LevelNumber = 28,
        IntegerLiteral = 29,
        DecimalLiteral = 30,
        FloatingPointLiteral = 31,
        // Literals - Syntax tokens
        PictureCharacterString = 32,
        CommentEntry = 33,
        ExecStatementText = 34,
        // Symbols
        SectionParagraphName = 35,
        IntrinsicFunctionName = 36,
        ExecTranslatorName = 37,
        PartialCobolWord = 38,
        UserDefinedWord = 39,
        // Keywords - Compiler directive starting tokens
        ASTERISK_CBL = 40,
        ASTERISK_CONTROL = 41,
        BASIS = 42,
        CBL = 43,
        COPY = 44,
        DELETE_CD = 45,
        EJECT = 46,
        ENTER = 47,
        EXEC_SQL_INCLUDE = 48,
        INSERT = 49,
        PROCESS = 50,
        READY = 51,
        RESET = 52,
        REPLACE = 53,
        SERVICE_CD = 54,
        SKIP1 = 55,
        SKIP2 = 56,
        SKIP3 = 57,
        TITLE = 58,
        // Keywords - Code element starting tokens
        ACCEPT = 59,
        ADD = 60,
        ALTER = 61,
        APPLY = 62,
        CALL = 63,
        CANCEL = 64,
        CLOSE = 65,
        COMPUTE = 66,
        CONFIGURATION = 67,
        CONTINUE = 68,
        DATA = 69,
        DECLARATIVES = 70,
        DECLARE = 71,
        DELETE = 72,
        DISPLAY = 73,
        DIVIDE = 74,
        ELSE = 75,
        END = 76,
        END_ADD = 77,
        END_CALL = 78,
        END_COMPUTE = 79,
        END_DECLARE = 80,
        END_DELETE = 81,
        END_DIVIDE = 82,
        END_EVALUATE = 83,
        END_EXEC = 84,
        END_IF = 85,
        END_INVOKE = 86,
        END_MULTIPLY = 87,
        END_PERFORM = 88,
        END_READ = 89,
        END_RETURN = 90,
        END_REWRITE = 91,
        END_SEARCH = 92,
        END_START = 93,
        END_STRING = 94,
        END_SUBTRACT = 95,
        END_UNSTRING = 96,
        END_WRITE = 97,
        END_XML = 98,
        ENTRY = 99,
        ENVIRONMENT = 100,
        EVALUATE = 101,
        EXEC = 102,
        EXECUTE = 103,
        EXIT = 104,
        FD = 105,
        FILE = 106,
        FILE_CONTROL = 107,
        GO = 108,
        GOBACK = 109,
        I_O_CONTROL = 110,
        ID = 111,
        IDENTIFICATION = 112,
        IF = 113,
        INITIALIZE = 114,
        INPUT_OUTPUT = 115,
        INSPECT = 116,
        INVOKE = 117,
        LINKAGE = 118,
        LOCAL_STORAGE = 119,
        MERGE = 120,
        MOVE = 121,
        MULTIPLE = 122,
        MULTIPLY = 123,
        NEXT = 124,
        OBJECT_COMPUTER = 125,
        OPEN = 126,
        PERFORM = 127,
        PROCEDURE = 128,
        READ = 129,
        RELEASE = 130,
        REPOSITORY = 131,
        RERUN = 132,
        RETURN = 133,
        REWRITE = 134,
        SAME = 135,
        SD = 136,
        SEARCH = 137,
        SELECT = 138,
        SERVICE = 139,
        SET = 140,
        SORT = 141,
        SOURCE_COMPUTER = 142,
        SPECIAL_NAMES = 143,
        START = 144,
        STOP = 145,
        STRING = 146,
        SUBTRACT = 147,
        UNSTRING = 148,
        USE = 149,
        WHEN = 150,
        WORKING_STORAGE = 151,
        WRITE = 152,
        XML = 153,
        // Keywords - Special registers
        ADDRESS = 154,
        DEBUG_CONTENTS = 155,
        DEBUG_ITEM = 156,
        DEBUG_LINE = 157,
        DEBUG_NAME = 158,
        DEBUG_SUB_1 = 159,
        DEBUG_SUB_2 = 160,
        DEBUG_SUB_3 = 161,
        JNIENVPTR = 162,
        LENGTH = 163,
        LINAGE_COUNTER = 164,
        RETURN_CODE = 165,
        SHIFT_IN = 166,
        SHIFT_OUT = 167,
        SORT_CONTROL = 168,
        SORT_CORE_SIZE = 169,
        SORT_FILE_SIZE = 170,
        SORT_MESSAGE = 171,
        SORT_MODE_SIZE = 172,
        SORT_RETURN = 173,
        TALLY = 174,
        WHEN_COMPILED = 175,
        XML_CODE = 176,
        XML_EVENT = 177,
        XML_INFORMATION = 178,
        XML_NAMESPACE = 179,
        XML_NAMESPACE_PREFIX = 180,
        XML_NNAMESPACE = 181,
        XML_NNAMESPACE_PREFIX = 182,
        XML_NTEXT = 183,
        XML_TEXT = 184,
        // Keywords - Figurative constants
        HIGH_VALUE = 185,
        HIGH_VALUES = 186,
        LOW_VALUE = 187,
        LOW_VALUES = 188,
        NULL = 189,
        NULLS = 190,
        QUOTE = 191,
        QUOTES = 192,
        SPACE = 193,
        SPACES = 194,
        ZERO = 195,
        ZEROES = 196,
        ZEROS = 197,
        SymbolicCharacter = 198,
        // Keywords - Special object identifiers
        SELF = 199,
        SUPER = 200,
        // Keywords - Syntax tokens
        ACCESS = 201,
        ADVANCING = 202,
        AFTER = 203,
        ALL = 204,
        ALPHABET = 205,
        ALPHABETIC = 206,
        ALPHABETIC_LOWER = 207,
        ALPHABETIC_UPPER = 208,
        ALPHANUMERIC = 209,
        ALPHANUMERIC_EDITED = 210,
        ALSO = 211,
        ALTERNATE = 212,
        AND = 213,
        ANY = 214,
        ARE = 215,
        AREA = 216,
        AREAS = 217,
        ASCENDING = 218,
        ASSIGN = 219,
        AT = 220,
        ATTRIBUTE = 221,
        ATTRIBUTES = 222,
        AUTHOR = 223,
        BEFORE = 224,
        BEGINNING = 225,
        BINARY = 226,
        BLANK = 227,
        BLOCK = 228,
        BOTTOM = 229,
        BY = 230,
        CHARACTER = 231,
        CHARACTERS = 232,
        CLASS = 233,
        CLASS_ID = 234,
        COBOL = 235,
        CODE = 236,
        CODE_SET = 237,
        COLLATING = 238,
        COM_REG = 239,
        COMMA = 240,
        COMMON = 241,
        COMP = 242,
        COMP_1 = 243,
        COMP_2 = 244,
        COMP_3 = 245,
        COMP_4 = 246,
        COMP_5 = 247,
        COMPUTATIONAL = 248,
        COMPUTATIONAL_1 = 249,
        COMPUTATIONAL_2 = 250,
        COMPUTATIONAL_3 = 251,
        COMPUTATIONAL_4 = 252,
        COMPUTATIONAL_5 = 253,
        CONTAINS = 254,
        CONTENT = 255,
        CONVERTING = 256,
        CORR = 257,
        CORRESPONDING = 258,
        COUNT = 259,
        CURRENCY = 260,
        DATE = 261,
        DATE_COMPILED = 262,
        DATE_WRITTEN = 263,
        DAY = 264,
        DAY_OF_WEEK = 265,
        DBCS = 266,
        DEBUGGING = 267,
        DECIMAL_POINT = 268,
        DELIMITED = 269,
        DELIMITER = 270,
        DEPENDING = 271,
        DESCENDING = 272,
        DISPLAY_1 = 273,
        DIVISION = 274,
        DOWN = 275,
        DUPLICATES = 276,
        DYNAMIC = 277,
        EBCDIC = 278,
        EGCS = 279,
        ELEMENT = 280,
        ENCODING = 281,
        END_OF_PAGE = 282,
        ENDING = 283,
        EOP = 284,
        EQUAL = 285,
        ERROR = 286,
        EVERY = 287,
        EXCEPTION = 288,
        EXTEND = 289,
        EXTERNAL = 290,
        FACTORY = 291,
        FALSE = 292,
        FILLER = 293,
        FIRST = 294,
        FOOTING = 295,
        FOR = 296,
        FROM = 297,
        FUNCTION = 298,
        FUNCTION_POINTER = 299,
        GENERATE = 300,
        GIVING = 301,
        GLOBAL = 302,
        GREATER = 303,
        GROUP_USAGE = 304,
        I_O = 305,
        IN = 306,
        INDEX = 307,
        INDEXED = 308,
        INHERITS = 309,
        INITIAL = 310,
        INPUT = 311,
        INSTALLATION = 312,
        INTO = 313,
        INVALID = 314,
        IS = 315,
        JUST = 316,
        JUSTIFIED = 317,
        KANJI = 318,
        KEY = 319,
        LABEL = 320,
        LEADING = 321,
        LEFT = 322,
        LESS = 323,
        LINAGE = 324,
        LINE = 325,
        LINES = 326,
        LOCK = 327,
        MEMORY = 328,
        METHOD = 329,
        METHOD_ID = 330,
        MODE = 331,
        MODULES = 332,
        MORE_LABELS = 333,
        NAME = 334,
        NAMESPACE = 335,
        NAMESPACE_PREFIX = 336,
        NATIONAL = 337,
        NATIONAL_EDITED = 338,
        NATIVE = 339,
        NEGATIVE = 340,
        NEW = 341,
        NO = 342,
        NONNUMERIC = 343,
        NOT = 344,
        NUMERIC = 345,
        NUMERIC_EDITED = 346,
        OBJECT = 347,
        OCCURS = 348,
        OF = 349,
        OFF = 350,
        OMITTED = 351,
        ON = 352,
        OPTIONAL = 353,
        OR = 354,
        ORDER = 355,
        ORGANIZATION = 356,
        OTHER = 357,
        OUTPUT = 358,
        OVERFLOW = 359,
        OVERRIDE = 360,
        PACKED_DECIMAL = 361,
        PADDING = 362,
        PAGE = 363,
        PARSE = 364,
        PASSWORD = 365,
        PIC = 366,
        PICTURE = 367,
        POINTER = 368,
        POSITION = 369,
        POSITIVE = 370,
        PROCEDURE_POINTER = 371,
        PROCEDURES = 372,
        PROCEED = 373,
        PROCESSING = 374,
        PROGRAM = 375,
        PROGRAM_ID = 376,
        RANDOM = 377,
        RECORD = 378,
        RECORDING = 379,
        RECORDS = 380,
        RECURSIVE = 381,
        REDEFINES = 382,
        REEL = 383,
        REFERENCE = 384,
        REFERENCES = 385,
        RELATIVE = 386,
        RELOAD = 387,
        REMAINDER = 388,
        REMOVAL = 389,
        RENAMES = 390,
        REPLACING = 391,
        RESERVE = 392,
        RETURNING = 393,
        REVERSED = 394,
        REWIND = 395,
        RIGHT = 396,
        ROUNDED = 397,
        RUN = 398,
        SECTION = 399,
        SECURITY = 400,
        SEGMENT_LIMIT = 401,
        SENTENCE = 402,
        SEPARATE = 403,
        SEQUENCE = 404,
        SEQUENTIAL = 405,
        SIGN = 406,
        SIZE = 407,
        SORT_MERGE = 408,
        SQL = 409,
        SQLIMS = 410,
        STANDARD = 411,
        STANDARD_1 = 412,
        STANDARD_2 = 413,
        STATUS = 414,
        SUPPRESS = 415,
        SYMBOL = 416,
        SYMBOLIC = 417,
        SYNC = 418,
        SYNCHRONIZED = 419,
        TALLYING = 420,
        TAPE = 421,
        TEST = 422,
        THAN = 423,
        THEN = 424,
        THROUGH = 425,
        THRU = 426,
        TIME = 427,
        TIMES = 428,
        TO = 429,
        TOP = 430,
        TRACE = 431,
        TRAILING = 432,
        TRUE = 433,
        TYPE = 434,
        UNBOUNDED = 435,
        UNIT = 436,
        UNTIL = 437,
        UP = 438,
        UPON = 439,
        USAGE = 440,
        USING = 441,
        VALIDATING = 442,
        VALUE = 443,
        VALUES = 444,
        VARYING = 445,
        WITH = 446,
        WORDS = 447,
        WRITE_ONLY = 448,
        XML_DECLARATION = 449,
        XML_SCHEMA = 450,
        YYYYDDD = 451,
        YYYYMMDD = 452,
        // Keywords - Cobol 2002
        TYPEDEF = 453,
        STRONG = 454,
        // Keywords - TypeCobol
        UNSAFE = 455,
        PUBLIC = 456,
        PRIVATE = 457,
        INOUT = 458,
        // Group of tokens produced by the preprocessor
        // - compiler directives
        CompilerDirective = 459,
        CopyImportDirective = 460,
        ReplaceDirective = 461,
        // - internal token groups -> used by the preprocessor only
        ContinuationTokenGroup = 462
    }

    public static class TokenConst {
        private static readonly TokenType[] TypeCobolTokenType =
        {
            TokenType.DECLARE, TokenType.END_DECLARE, TokenType.PUBLIC, TokenType.PRIVATE, TokenType.INOUT,
            TokenType.UNSAFE
        };

        private static readonly TokenType[] Cobol2002TokenType = {TokenType.STRONG, TokenType.TYPEDEF};

        public static CobolLanguageLevel GetCobolLanguageLevel(TokenType tokenType) {
            if (TypeCobolTokenType.Contains(tokenType))
            {
                return CobolLanguageLevel.TypeCobol;
            }
            if (Cobol2002TokenType.Contains(tokenType))
            {
                return CobolLanguageLevel.Cobol2002;
            }
            return CobolLanguageLevel.Cobol85;
        }
    }
}
