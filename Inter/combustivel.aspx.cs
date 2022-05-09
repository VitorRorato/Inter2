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
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    carregarTanque(con);
                    carregarVeiculo(con);
                    carregarFuncionario(con);
                    carregarGridAbastecimento(con);
                }
            }
        }

        private void carregarGridAbastecimento(VIACAOARAUJOEntities con)
        {

            List<ABASTECIMENTO> lista = con.ABASTECIMENTO.ToList();

            gridAbastecimento.DataSource = lista.OrderBy(x => x.DATA_ABASTECIMENTO).Reverse();
            gridAbastecimento.DataBind();

        }

        protected void btnSalvarTanque_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                try
                {
                    if (string.IsNullOrWhiteSpace(txtNomeTanque.Text))
                    {
                        lblValidacao.Text = "Informe o Tanque!";
                        return;
                    }

                    TANQUE tanque = new TANQUE();

                    tanque.NOME = txtNomeTanque.Text;
                    tanque.CAPACIDADE = Convert.ToDouble(txtCapacidadeTanque.Text);

                    con.TANQUE.Add(tanque);
                    con.SaveChanges();

                    txtNomeTanque.Text = string.Empty;
                    txtCapacidadeTanque.Text = string.Empty;
                }
                catch (Exception)
                {

                    lblValidacao.Text="Erro ao Salvar as informações!";
                }
                
            }
        }

        private void carregarVeiculo(VIACAOARAUJOEntities con)
        {

            List<VEICULO> veiculos = con.VEICULO.ToList();

            ddlVeiculo.DataSource = veiculos;
            ddlVeiculo.DataValueField = "ID";
            ddlVeiculo.DataTextField = "PREFIXO";
            ddlVeiculo.DataBind();

            ddlBusca.DataSource= veiculos;
            ddlBusca.DataValueField = "ID";
            ddlBusca.DataTextField = "PREFIXO";
            ddlBusca.DataBind();

        }

        private void carregarFuncionario(VIACAOARAUJOEntities con)
        {
            List<FUNCIONARIO> funcionario = con.FUNCIONARIO.ToList();

            ddlFuncionario.DataSource = funcionario;
            ddlFuncionario.DataTextField = "NOME";
            ddlFuncionario.DataValueField = "ID";
            ddlFuncionario.DataBind();

        }

        private void carregarTanque(VIACAOARAUJOEntities con)
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

        protected void btnSalvarAbastecimento_Click(object sender, EventArgs e)
        {
            using(VIACAOARAUJOEntities con =new VIACAOARAUJOEntities())
            {
                try
                {
                    double distancia = 0, consumo = 0, kmatual = 0, litros = 0, km = 0;

                    if (string.IsNullOrWhiteSpace(txtData.Text) &&
                        string.IsNullOrWhiteSpace(txtKm.Text) &&
                        string.IsNullOrWhiteSpace(txtLocal.Text) &&
                        string.IsNullOrWhiteSpace(txtLitros.Text))
                    {
                        lblValidacao.Text = "Favor preencher todos os campos!";
                        return;
                    }
                    else
                    {
                        ABASTECIMENTO a = new ABASTECIMENTO();

                        List<ABASTECIMENTO> lista = con.ABASTECIMENTO.Where(
                            linha => linha.FK_VEICULO.ToString().Equals(ddlVeiculo.SelectedValue.ToString())).ToList();
                        int contagem = lista.Count();

                        lista.OrderBy(x=>x.KM).LastOrDefault();

                        if (double.TryParse(txtKm.Text, out kmatual) == false)
                        {
                            lblValidacao.Text = "Quilometragem Inválida";
                            return;
                        }
                        else if (double.TryParse(txtLitros.Text.Replace(".", ","), out litros) == false)
                        {
                            lblValidacao.Text = "Informe um valor válido";
                            return;
                        }

                        if (kmatual < 0 || litros < 0)
                        {
                            lblValidacao.Text = "Valores Negativos não serão aceitos!";
                            return;
                        }


                        if (contagem != 0)
                        {
                            km = lista.Last().KM;

                            if (kmatual < km)
                            {
                                lblValidacao.Text = "Quilometragem não pode ser menor que o ultimo Resgistro!";
                                return;
                            }

                            distancia = kmatual - lista.Last().KM;
                            consumo = distancia / litros;
                        }
                        else
                        {
                            distancia = 0;
                            consumo = 0;
                        }

                        a.DATA_ABASTECIMENTO = Convert.ToDateTime(txtData.Text);
                        a.CONSUMO_MEDIO = Math.Round(consumo, 2);
                        a.DISTANCIA_PERCORRIDA = distancia;
                        a.KM = kmatual;
                        a.POSTO = txtLocal.Text.ToUpper();
                        a.LITROS_COMBUSTIVEL = litros;
                        a.FK_VEICULO = Convert.ToInt32(ddlVeiculo.SelectedValue);
                        a.FK_TANQUE_COMBUSTIVEL = Convert.ToInt32(ddlTanqueAbastecimento.SelectedValue);
                        a.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionario.SelectedValue);

                        con.ABASTECIMENTO.Add(a);
                        con.SaveChanges();

                        carregarGridAbastecimento(con);
                    }
                }
                catch
                {
                    lblValidacao.Text = "Erro, Favor verificar os dados informados!";
                }
            }
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                List<ABASTECIMENTO> lista = con.ABASTECIMENTO.Where(
                           linha => linha.FK_VEICULO.ToString().Equals(ddlBusca.SelectedValue.ToString())).ToList();

                gridAbastecimento.DataSource = lista.OrderBy(x => x.DATA_ABASTECIMENTO).Reverse();
                gridAbastecimento.DataBind();
            }
        }

        protected void btnTodos_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                carregarGridAbastecimento(con);
            }
        }

        protected void btnRelatorio_Click(object sender, EventArgs e)
        {

        }
    }
}