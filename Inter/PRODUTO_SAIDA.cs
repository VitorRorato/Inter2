//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inter
{
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUTO_SAIDA
    {
        public int ID { get; set; }
        public int FK_PRODUTO { get; set; }
        public int QUANTIDADE { get; set; }
        public System.DateTime DATA { get; set; }
        public int FK_FUNCIONARIO { get; set; }
        public int FK_VEICULO { get; set; }
        public Nullable<double> KM { get; set; }
    
        public virtual FUNCIONARIO FUNCIONARIO { get; set; }
        public virtual PRODUTO PRODUTO { get; set; }
        public virtual VEICULO VEICULO { get; set; }
    }
}
