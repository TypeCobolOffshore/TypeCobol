﻿using System;
using TypeCobol.Compiler.Scanner;

namespace TypeCobol.Compiler.CodeElements
{
    /// <summary>
    /// Boolean value defined by a single Token in the Cobol syntax
    /// </summary>
    public class SyntaxBoolean
    {
        public SyntaxBoolean(Token token)
        {
            Token = token;
        }

        /// <summary>
        /// Token defining the boolean value
        /// - not null if true
        /// - null if false
        /// </summary>
        public Token Token { get; private set; }

        /// <summary>
        /// Boolean value defined by the Token
        /// </summary>
        public bool Value
        {
            get
            {
                if(Token != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Common instance to represent the False value
        /// </summary>
        public static SyntaxBoolean False = new SyntaxBoolean(null);

        /// <summary>
        /// Debug string
        /// </summary>
        public override string ToString()
        {
            return Value.ToString();
        }
    }
}