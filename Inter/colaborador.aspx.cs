using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class colaborador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            carregarGrid();
        }

        private void carregarGrid()
        {
            VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities();

            var lista = conexao.FUNCIONARIO.ToList();
            gridColaborador.DataSource = lista;
            gridColaborador.DataBind();
        }

        protected void gridColaborador_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}