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

                    COMBUSTIVEL_DISPONIVEL comb = new COMBUSTIVEL_DISPONIVEL();

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
                        List<COMBUSTIVEL_DISPONIVEL> combustivel = con.COMBUSTIVEL_DISPONIVEL.Where(
                            linha => linha.FK_TANQUE.ToString().Equals(ddlTanqueAbastecimento.SelectedValue.ToString())).ToList();

                        COMBUSTIVEL_DISPONIVEL comb = new COMBUSTIVEL_DISPONIVEL();

                        ABASTECIMENTO a = new ABASTECIMENTO();

                        List<ABASTECIMENTO> lista = con.ABASTECIMENTO.Where(
                            linha => linha.FK_VEICULO.ToString().Equals(ddlVeiculo.SelectedValue.ToString())).ToList();
                        
                        int contagem = lista.Count();

                        int cont = combustivel.Count();

                        lista.OrderBy(x => x.KM).LastOrDefault();

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

                        string l = txtLocal.Text.ToUpper();

                        a.DATA_ABASTECIMENTO = Convert.ToDateTime(txtData.Text);
                        a.CONSUMO_MEDIO = Math.Round(consumo, 2);
                        a.DISTANCIA_PERCORRIDA = distancia;
                        a.KM = kmatual;
                        a.POSTO = txtLocal.Text.ToUpper();
                        a.LITROS_COMBUSTIVEL = litros;
                        a.FK_VEICULO = Convert.ToInt32(ddlVeiculo.SelectedValue);
                        a.FK_TANQUE_COMBUSTIVEL = Convert.ToInt32(ddlTanqueAbastecimento.SelectedValue);
                        a.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionario.SelectedValue);

                        if (l == "GARAGEM" && cont!=0)
                        {
                            comb = con.COMBUSTIVEL_DISPONIVEL.FirstOrDefault(
                                linha => linha.FK_TANQUE.ToString().Equals(ddlTanqueAbastecimento.SelectedValue.ToString()));

                            comb.QUANTIDADE = combustivel.Last().QUANTIDADE - litros;

                            con.Entry(comb);
                            con.ABASTECIMENTO.Add(a);
                            con.SaveChanges();

                        }
                        else
                        {
                            con.ABASTECIMENTO.Add(a);
                            con.SaveChanges();
                        }

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

        protected void btnSalvarCombustivel_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                double quantidade = 0;

                int cont = 0;

                QUANTIDADE_TANQUE qtd = new QUANTIDADE_TANQUE();

                COMBUSTIVEL_DISPONIVEL comb = new COMBUSTIVEL_DISPONIVEL();

                List<COMBUSTIVEL_DISPONIVEL> lista = con.COMBUSTIVEL_DISPONIVEL.Where(
                    linha => linha.FK_TANQUE.ToString().Equals(ddlTanque.SelectedValue.ToString())).ToList();

                cont = lista.Count();

                if (string.IsNullOrWhiteSpace(txtDataCombustivel.Text) &&
                    string.IsNullOrWhiteSpace(txtQuantidadeCombustivel.Text))
                {
                    lblValidacao.Text = "Favor preencher todos os campos!";
                    return;
                }
                else if (double.TryParse(txtQuantidadeCombustivel.Text, out quantidade) == false)
                {
                    lblValidacao.Text = "Informe um valor válido!";
                    return;
                }
                else if (quantidade <= 0)
                {
                    lblValidacao.Text = "Valor zero ou nulo não é permitido!";
                    return;
                }

                qtd.DATA = Convert.ToDateTime(txtDataCombustivel.Text);
                qtd.QUANTIDADE = quantidade;
                qtd.FK_TANQUE = Convert.ToInt32(ddlTanque.SelectedValue);

                con.QUANTIDADE_TANQUE.Add(qtd);
                con.SaveChanges();

                if (cont<=0)
                {
                    comb.FK_TANQUE= Convert.ToInt32(ddlTanque.SelectedValue);
                    comb.QUANTIDADE= quantidade;

                    con.COMBUSTIVEL_DISPONIVEL.Add(comb);
                    con.SaveChanges();
                }
                else
                {

                    comb = con.COMBUSTIVEL_DISPONIVEL.FirstOrDefault(linha => linha.FK_TANQUE.ToString().Equals(
                         ddlTanque.SelectedValue.ToString()));

                    comb.QUANTIDADE = quantidade + lista.Last().QUANTIDADE;

                    con.Entry(comb);
                    con.SaveChanges();
                }

            }
        }

        protected void btnExcluirAbastecimento_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    if (gridAbastecimento.SelectedValue != null)
                    {
                        ABASTECIMENTO abast = con.ABASTECIMENTO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(gridAbastecimento.SelectedValue.ToString()));

                        con.ABASTECIMENTO.Remove(abast);

                        con.SaveChanges();

                    }
                    gridAbastecimento.SelectedIndex = -1;


                    carregarGridAbastecimento(con);

                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro Ao excluir O registro";
            }
        }
    }
}