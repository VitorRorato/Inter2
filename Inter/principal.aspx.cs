using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    carregarCombustivel(con);
                    carregarManutencao(con);
                    Combustivel(con);
                }
            }
        }

        private void carregarCombustivel(VIACAOARAUJOEntities con)
        {
            List<COMBUSTIVEL_DISPONIVEL> lista = con.COMBUSTIVEL_DISPONIVEL.ToList();
            gridCombustivel.DataSource = lista;
            gridCombustivel.DataBind();
        }

        private void carregarManutencao(VIACAOARAUJOEntities con)
        {
            List<MANUTENCAO> lista = con.MANUTENCAO.ToList();

            int id = lista.Last().ID;

            List<MANUTENCAO> resultado = con.MANUTENCAO.Where(
                linha => linha.ID.ToString().Equals(id.ToString())).ToList(); ;

            gridManutencao.DataSource = resultado;
            gridManutencao.DataBind();
        }

        private void Combustivel(VIACAOARAUJOEntities con)
        {
            List<ABASTECIMENTO> lista = con.ABASTECIMENTO.ToList();

            int id = lista.Last().ID;

            List<ABASTECIMENTO> res = con.ABASTECIMENTO.Where(
                linha=>linha.ID.ToString().Equals(id.ToString())).ToList();

            gridAbastecimento.DataSource = res;
            gridAbastecimento.DataBind();
        }
    }
}