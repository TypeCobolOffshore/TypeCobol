﻿using TypeCobol.Compiler.CodeElements.Expressions;

namespace TypeCobol.Compiler.CodeElements {

	using JetBrains.Annotations;
	using System.Collections.Generic;

    /// <summary>p369: The MOVE statement transfers data from one area of storage to one or more other areas.</summary>
    public abstract class MoveStatement : StatementElement, VariableWriter,FunctionCaller
    {
        protected MoveStatement(StatementType statementType) : base(CodeElementType.MoveStatement, statementType) { }
    // [TYPECOBOL]
	    public SyntaxProperty<bool> Unsafe { get; set; }
	    public bool IsUnsafe { get { return Unsafe != null && Unsafe.Value; } }
    // [/TYPECOBOL]

	    protected IDictionary<QualifiedName,object> variables;
	    protected List<FunctionCall> _functions = null;

        public abstract IDictionary<QualifiedName,object> Variables { get; }
	    public virtual  IDictionary<QualifiedName,object> VariablesWritten {
		    [NotNull]
		    get {
			    var written = new Dictionary<QualifiedName,object>();
			    foreach(var v in Variables) if (v.Value != null) written.Add(v.Key, v.Value);
			    return written;
		    }
	    }

        public abstract IList<FunctionCall> FunctionCalls { get; }

        public override bool VisitCodeElement(IASTVisitor astVisitor) {
            return base.VisitCodeElement(astVisitor) && astVisitor.Visit(this)
                   //TODO VariableUser
                   && astVisitor.VisitVariableWriter(this)
                   && this.ContinueVisitToChildren(astVisitor, Unsafe) //Order is important here, as unsafe is part of VariableWriter interface
                                                                       //TODO VariablesWritten
                   && astVisitor.VisitFunctionCaller(this)
                   && this.ContinueVisitToChildren(astVisitor, FunctionCalls); //Order is important here, as FunctionsCall is part of VariableWriter interface
        }
    }

    /// <summary>
    ///  p369: Format 1: MOVE statement
    ///
    /// When format 1 (no CORRESPONDING) is specified:
    /// * All identifiers can reference alphanumeric group items, national group items, or
    /// elementary items.
    /// * When one of identifier-1 or identifier-2 references a national group item and the
    /// other operand references an alphanumeric group item, the national group is
    /// processed as a group item; in all other cases, the national group item is
    /// processed as an elementary data item of category national.
    /// * The data in the sending area is moved into the data item referenced by each
    /// identifier-2 in the order in which the identifier-2 data items are specified in the
    /// MOVE statement. See “Elementary moves” on page 370 and “Group moves” on page 374 below.
    /// </summary>
    public class MoveSimpleStatement : MoveStatement {
	    public MoveSimpleStatement(Variable sendingVariable, ReceivingStorageArea[] receivingStorageAreas, BooleanValue sendingBoolean)
			    : base(StatementType.MoveSimpleStatement) {
		    SendingVariable = sendingVariable;
		    SendingBoolean = sendingBoolean;
		    ReceivingStorageAreas = receivingStorageAreas;
	    }

	    /// <summary>The sending area.</summary>
	    public Variable SendingVariable { get; private set; }
    // [TYPECOBOL]
	    public BooleanValue SendingBoolean { get; private set; }
    // [/TYPECOBOL]
	    /// <summary>The receiving areas. Must not reference an intrinsic function.</summary>
	    public ReceivingStorageArea[] ReceivingStorageAreas { get; private set; }

        public override bool VisitCodeElement(IASTVisitor astVisitor) {
            return base.VisitCodeElement(astVisitor) && astVisitor.Visit(this)
                   && this.ContinueVisitToChildren(astVisitor, SendingVariable, SendingBoolean)
                   && this.ContinueVisitToChildren(astVisitor, (IEnumerable<IVisitable>) ReceivingStorageAreas);
        }

	    public IDictionary<StorageArea,object> Vars {
		    [NotNull]
		    get {
			    //if (variables != null) return variables;
			    var variables = new Dictionary<StorageArea,object>();
		        var sendingReference = Sending as SymbolReference;
		        if (sendingReference != null) variables.Add(new DataOrConditionStorageArea(sendingReference), null);
			    foreach(var receiving in ReceivingStorageAreas) variables.Add(receiving.StorageArea, Sending);
			    return variables;
		    }
	    }
	    private object Sending {
		    [CanBeNull]
		    get {
			    if (SendingVariable != null) {
				    if (SendingVariable.IsLiteral) {
					    if (SendingVariable.NumericValue != null) return SendingVariable.NumericValue.Value;
					    if (SendingVariable.AlphanumericValue != null) return SendingVariable.AlphanumericValue.Value;
					    throw new System.NotSupportedException();
				    }
				    return SendingVariable.MainSymbolReference;
			    }
			    if (SendingBoolean != null) return SendingBoolean.Value;
			    return null;
		    }
	    }

	    public override IDictionary<QualifiedName,object> Variables {
		    [NotNull]
		    get {
			    if (variables != null) return variables;
			    variables = new Dictionary<QualifiedName,object>();

			    var sending = SendingItem as QualifiedName;
			    if (sending != null) variables.Add(sending, null);

                foreach(var item in ReceivingStorageAreas) {
                    var name = new URI(item.StorageArea.SymbolReference.Name);
                    if (variables.ContainsKey(name))
                        if (item.StorageArea is DataOrConditionStorageArea) continue; // same variable with (presumably) different subscript
                        else throw new System.ArgumentException(name+" already written, but not subscripted?");
                    else variables.Add(name, SendingItem);
                }

                return variables;
		    }
	    }

        public IDictionary<QualifiedName,ICollection<List<SubscriptExpression>>> Subscripts {
		    get {
			    var subscripts = new Dictionary<QualifiedName,ICollection<List<SubscriptExpression>>>();
			    if (SendingVariable != null) {
				    var kv = GetSubscriptedVariable(SendingVariable.StorageArea);
                    if (!kv.Equals(default(KeyValuePair<QualifiedName,List<SubscriptExpression>>))) {
                        AddKeyValue(subscripts, kv);
				    }
			    }
			    foreach(var v in ReceivingStorageAreas) {
				    var kv = GetSubscriptedVariable(v.StorageArea);
                    if (!kv.Equals(default(KeyValuePair<QualifiedName,List<SubscriptExpression>>))) {
                        AddKeyValue(subscripts, kv);
				    }
			    }
			    return subscripts;
		    }
	    }
	    private KeyValuePair<QualifiedName,List<SubscriptExpression>> GetSubscriptedVariable(StorageArea variable) {
            var subscripted = variable as DataOrConditionStorageArea;
            if (subscripted == null || subscripted.Subscripts.Count < 1) return default(KeyValuePair<QualifiedName,List<SubscriptExpression>>);
            var name = new URI(variable.SymbolReference.Name);
            return new KeyValuePair<QualifiedName,List<SubscriptExpression>>(name, subscripted.Subscripts);
        }
        private void AddKeyValue<K,V>([NotNull] Dictionary<K,ICollection<List<V>>> map, KeyValuePair<K,List<V>> kv) {
            ICollection<List<V>> values = new List<List<V>>();
            if (map.ContainsKey(kv.Key)) {
                values = map[kv.Key];
            } // else values is already initialized as an empty list
            values.Add(kv.Value);
            map[kv.Key] = values;
        }

        private object SendingItem {
		    [CanBeNull]
		    get {
		        if (SendingVariable != null) {
				    if (SendingVariable.IsLiteral) {
					    if (SendingVariable.NumericValue != null) return SendingVariable.NumericValue.Value;
					    if (SendingVariable.AlphanumericValue != null) return SendingVariable.AlphanumericValue.Value;
					    throw new System.NotSupportedException();
				    }
                    if(SendingVariable.MainSymbolReference != null)
                        return new URI(SendingVariable.MainSymbolReference.Name);
                    return null;
		        }
		        if (SendingBoolean != null) return SendingBoolean.Value;
		        return null;
		    }
	    }

	    public override IList<FunctionCall> FunctionCalls {
		    [NotNull]
		    get {
			    if (_functions != null) return _functions;

			    _functions = new List<FunctionCall>();
			    FunctionCallResult sending = null;
			    if (SendingVariable != null) sending = SendingVariable.StorageArea as FunctionCallResult;
			    if (sending != null) _functions.Add(sending.FunctionCall);
			    return _functions;
		    }
	    }
    }

    /// <summary>
    /// p369: Format 2: MOVE statement with CORRESPONDING phrase
    ///
    /// When format 2 (with CORRESPONDING) is specified:
    /// * Both identifiers must be group items.
    /// * A national group item is processed as a group item (and not as an elementary
    /// data item of category national).
    /// * Selected items in identifier-1 are moved to identifier-2 according to the rules for
    /// the “CORRESPONDING phrase” on page 281. The results are the same as if
    /// each pair of CORRESPONDING identifiers were referenced in a separate MOVE
    /// statement.
    /// </summary>
    public class MoveCorrespondingStatement : MoveStatement {
	    public MoveCorrespondingStatement() : base(StatementType.MoveCorrespondingStatement) { }

	    /// <summary>
	    /// identifier-1
	    /// The sending group item.
	    /// </summary>
	    public DataOrConditionStorageArea FromGroupItem { get; set; }

	    /// <summary>
	    /// identifier-2
	    /// The receiving group item.
	    /// </summary>
	    public DataOrConditionStorageArea ToGroupItem { get; set; }


        public override bool VisitCodeElement(IASTVisitor astVisitor) {
            return base.VisitCodeElement(astVisitor) && astVisitor.Visit(this)
                && this.ContinueVisitToChildren(astVisitor, FromGroupItem, ToGroupItem);
        }

        public override IDictionary<QualifiedName,object> Variables {
		    [NotNull]
		    get {
			    if (variables != null) return variables;

			    variables = new Dictionary<QualifiedName,object>();
                if (FromGroupItem != null && FromGroupItem.SymbolReference != null)
                    variables.Add(new URI(FromGroupItem.SymbolReference.Name), null);
                if (  ToGroupItem != null &&   ToGroupItem.SymbolReference != null)
                    variables.Add(  new URI(ToGroupItem.SymbolReference.Name), FromGroupItem!=null? new URI(FromGroupItem.SymbolReference.Name):null);
                return variables;
		    }
	    }

	    public override IList<FunctionCall> FunctionCalls {
		    [NotNull]
		    get {
			    if (_functions != null) return _functions;

			    _functions = new List<FunctionCall>();
			    return _functions;
		    }
	    }
    }



}
