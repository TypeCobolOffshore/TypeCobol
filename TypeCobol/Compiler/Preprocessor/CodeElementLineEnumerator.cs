using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TypeCobol.Compiler.CodeElements;
using TypeCobol.Compiler.Parser;
using TypeCobol.Compiler.Scanner;

namespace TypeCobol.Compiler.Preprocessor
{
    class CodeElementLineEnumerator : IEnumerator<ICodeElementsLine>
    {
        private readonly ITokensLinesIterator _tokensIterator;

        public CodeElementLineEnumerator(ITokensLinesIterator tokensIterator)
        {
            this._tokensIterator = tokensIterator;
        }


        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public bool MoveNext()
        {
            while (_tokensIterator.NextToken() != Token.END_OF_FILE)
            {
                if (_tokensIterator.CurrentToken.TokensLine is ICodeElementsLine && _tokensIterator.CurrentToken.TokensLine != Current)
                {
                    Current = (ICodeElementsLine) _tokensIterator.CurrentToken.TokensLine;
                    return true;
                }
            }
            return false;

        }

        public void Reset()
        {
            throw new NotImplementedException();
        }

        public ICodeElementsLine Current { get; private set; }


        object IEnumerator.Current
        {
            get { return Current; }
        }
    }
}
