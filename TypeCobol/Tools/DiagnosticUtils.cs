﻿using System.Collections.Generic;
using TypeCobol.Compiler.CodeElements;
using TypeCobol.Compiler.Concurrency;
using TypeCobol.Compiler.Parser;
using TypeCobol.Compiler.Scanner;

namespace TypeCobol.Tools {

public class Position {
	public int Line = 1;
	public int Character = 1;
}
public class Range {
	public Position Start = new Position();
	public Position End = new Position();
}
public class Diagnostic {
	public Range Range = new Range();
	public int Severity;
	public string Code;
	public string Source;
	public string Message;
}


public class CodeElementDiagnostics {
	private ISearchableReadOnlyList<ICodeElementsLine> Lines;

	/// <param name="lines">For example CodeElementsDocument.Lines</param>
	public CodeElementDiagnostics(ISearchableReadOnlyList<ICodeElementsLine> lines) {
		this.Lines = lines;
	}

	public IList<Diagnostic> GetDiagnostics(CodeElement e) {
		var results = new List<Diagnostic>();
		foreach(var d in e.Diagnostics) {
			var tokens = GetTokens(e.ConsumedTokens, d.ColumnStart, d.ColumnEnd);
			var diagnostic = AsDiagnostic(d);
			diagnostic.Range = GetRange(tokens, d.ColumnStart, d.ColumnEnd);
			results.Add(diagnostic);
		}
		return results;
	}

	private Range GetRange(IList<Token> tokens, int start, int end) {
		var range = new Range();
		range.Start.Line = GetLine(tokens[0].TokensLine);
		range.Start.Character = start;
		if (tokens.Count == 1) range.End.Line = range.Start.Line;
		else range.End.Line = GetLine(tokens[tokens.Count-1].TokensLine);
		range.End.Character = end;
		return range;
	}

	private int GetLine(ITokensLine line) {
		if (line != null) return Lines.IndexOf(line, line.InitialLineIndex);
		throw new System.ArgumentNullException("this.Line must be set from the source document snapshot");
	}

	private IList<Token> GetTokens(IList<Token> tokens, int start, int end) {
		var result = new List<Token>();
		foreach(var token in tokens) {
			if (token.StopIndex < start) continue;//before what we want
			if (token.StartIndex > end) break;//after what we want
			result.Add(token);
		}
		return result;
	}

	private Diagnostic AsDiagnostic(TypeCobol.Compiler.Diagnostics.Diagnostic d) {
		var diagnostic = new Diagnostic();
		diagnostic.Range.Start.Character = d.ColumnStart;
		diagnostic.Range.End.Character = d.ColumnEnd;
		diagnostic.Severity = (int)d.Info.Severity;
		diagnostic.Code = d.Info.Code.ToString();
		diagnostic.Source = d.Info.Document.Name;
		diagnostic.Message = d.Message;
		return diagnostic;
	}

	public IEnumerable<Diagnostic> AsDiagnostics(IEnumerable<TypeCobol.Compiler.Diagnostics.Diagnostic> diagnostics) {
		foreach(var diagnostic in diagnostics)
			yield return AsDiagnostic(diagnostic);
	}
}



}
