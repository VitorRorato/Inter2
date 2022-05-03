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
                List<ABASTECIMENTO> lista = con.ABASTECIMENTO.Where(
                    linha=>linha.FK_VEICULO.ToString().Equals(ddlVeiculo.SelectedValue)).ToList();

                ABASTECIMENTO a = new ABASTECIMENTO();

                double distancia = 0, consumo = 0, litros=0, km=0;
                
                if (double.TryParse(txtKm.Text, out distancia)== false)
                {
                    
                }

                if (double.TryParse(txtLitros.Text, out litros)!=false)
                {
                    consumo = distancia/litros;
                }

                a = con.ABASTECIMENTO.LastOrDefault(linha => linha.FK_VEICULO.Equals(ddlVeiculo.SelectedValue));
                if (a != null)
                {
                    distancia = distancia - lista.Last().KM;
                }
                else
                {
                    distancia = 0;
                }

                a.DATA_ABASTECIMENTO = Convert.ToDateTime(txtData.Text);
                a.KM = Convert.ToDouble(txtKm.Text);
                a.POSTO = txtLocal.Text;
                a.LITROS_COMBUSTIVEL = litros;
                a.DISTANCIA_PERCORRIDA = distancia;
                a.CONSUMO_MEDIO = consumo;
                a.FK_VEICULO = Convert.ToInt32(ddlVeiculo.SelectedValue);
                a.FK_TANQUE_COMBUSTIVEL = Convert.ToInt32(ddlTanqueAbastecimento.SelectedValue);
                a.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionario.SelectedValue);

                con.ABASTECIMENTO.Add(a);
                con.SaveChanges();

                carregarGridAbastecimento();
            }
        }
    }
}