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
    
    public partial class MANUTENCAO
    {
        public int ID { get; set; }
        public System.DateTime DATA { get; set; }
        public double KM_ATUAL { get; set; }
        public double KM_PROXIMA_TROCA { get; set; }
        public string FILTRO_AR { get; set; }
        public string FILTRO_COMBUSTIVEL { get; set; }
        public string FILTRO_RACOR { get; set; }
        public string FILTRO_OLEO_MOTOR { get; set; }
        public Nullable<double> QUANTIDADE_OLEO_MOTOR { get; set; }
        public int FK_VEICULO { get; set; }
        public string FILTRO_OLEO_1 { get; set; }
        public string FILTRO_OLEO_2 { get; set; }
    
        public virtual VEICULO VEICULO { get; set; }
    }
}
