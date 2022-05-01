using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class combustivel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarTanque();
                carregarVeiculo();
                carregarFuncionario();
                carregarGridAbastecimento();
            }
        }

        private void carregarGridAbastecimento()
        {
            using(VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                List<ABASTECIMENTO> lista = con.ABASTECIMENTO.ToList();

                gridAbastecimento.DataSource=lista;
                gridAbastecimento.DataBind();
            }
        }

        protected void btnSalvarTanque_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                TANQUE tanque = new TANQUE();

                tanque.NOME = txtNomeTanque.Text;
                tanque.CAPACIDADE = Convert.ToDouble(txtCapacidadeTanque.Text);

                con.TANQUE.Add(tanque);
                con.SaveChanges();

                
            }
        }

        private void carregarVeiculo()
        {
            using(VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                List<VEICULO> veiculos = con.VEICULO.ToList();

                ddlVeiculo.DataSource= veiculos;
                ddlVeiculo.DataValueField = "ID";
                ddlVeiculo.DataTextField = "PREFIXO";
                ddlVeiculo.DataBind();
            }
        }

        private void carregarFuncionario()
        {
            using(VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                List<FUNCIONARIO> funcionario = con.FUNCIONARIO.ToList();

                ddlFuncionario.DataSource = funcionario;
                ddlFuncionario.DataTextField = "NOME";
                ddlFuncionario.DataValueField = "ID";
                ddlFuncionario.DataBind();
            }
        }

        private void carregarTanque()
        {
            using(VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                List<TANQUE> tanqueList = con.TANQUE.ToList();

                ddlTanque.DataSource = tanqueList;
                ddlTanque.DataValueField = "ID";
                ddlTanque.DataTextField = "NOME";
                ddlTanque.DataBind();

                ddlTanqueAbastecimento.DataSource = tanqueList;
                ddlTanqueAbastecimento.DataValueField = "ID";
                ddlTanqueAbastecimento.DataTextField = "NOME";
                ddlTanqueAbastecimento.DataBind();
            }
        }

        protected void btnSalvarAbastecimento_Click(object sender, EventArgs e)
        {
            using(VIACAOARAUJOEntities con =new VIACAOARAUJOEntities())
            {

            }
        }
    }
}