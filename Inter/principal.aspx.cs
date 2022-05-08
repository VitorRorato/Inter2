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
            //carregarinformacoes();
        }

        /*private void carregarinformacoes()
        {
            VIACAOARAUJOEntities con = new VIACAOARAUJOEntities();
            VEICULO v = new VEICULO();

            lblVeiculo.Text = con.VEICULO.Count().ToString();

            ABASTECIMENTO a = new ABASTECIMENTO();

            lblabastecimento.Text = con.ABASTECIMENTO.LastOrDefault().ToString() + "" ;
        }*/
    }
}