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
    
    public partial class FUNCIONARIO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FUNCIONARIO()
        {
            this.ABASTECIMENTO = new HashSet<ABASTECIMENTO>();
            this.LOGIN = new HashSet<LOGIN>();
            this.PRODUTO_ENTRADA = new HashSet<PRODUTO_ENTRADA>();
            this.PRODUTO_SAIDA = new HashSet<PRODUTO_SAIDA>();
        }
    
        public int ID { get; set; }
        public string NOME { get; set; }
        public string CPF { get; set; }
        public string RG { get; set; }
        public int FK_CARGO { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ABASTECIMENTO> ABASTECIMENTO { get; set; }
        public virtual CARGO CARGO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LOGIN> LOGIN { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PRODUTO_ENTRADA> PRODUTO_ENTRADA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PRODUTO_SAIDA> PRODUTO_SAIDA { get; set; }
    }
}
