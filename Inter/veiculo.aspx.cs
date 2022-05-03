using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class veiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarPrefixo();
                carregarGrid();
                carregarGridManutencao();
            }
        }

        private void carregarGridManutencao()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                var lista = conexao.MANUTENCAO.ToList();
                gridManutencao.DataSource = lista;
                gridManutencao.DataBind();
            }
        }

        private void carregarGrid()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                var lista = conexao.VEICULO.ToList();
                gridVeiculo.DataSource = lista;
                gridVeiculo.DataBind();
            }
        }

        private void carregarPrefixo()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                var lista = conexao.VEICULO.ToList();
                ddlPrefixo.DataSource = lista;
                ddlPrefixo.DataValueField = "ID";
                ddlPrefixo.DataTextField = "PREFIXO";
                ddlPrefixo.DataBind();

                ddlPrefixoE.DataSource = lista;
                ddlPrefixoE.DataValueField = "ID";
                ddlPrefixoE.DataTextField = "PREFIXO";
                ddlPrefixoE.DataBind();
            }

        }

        protected void btnSalvarVeiculo_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                double km=0;

                if (string.IsNullOrEmpty(txtPlaca.Text) ||
                    (string.IsNullOrEmpty(txtPrefixo.Text)) ||
                    (string.IsNullOrEmpty(txtKm.Text)))
                {
                    lblValidacao.Text = "Favor Preencher todos os Campos solicitados";
                    return;
                }
                else
                {
                    VEICULO vei = new VEICULO();

                    vei = conexao.VEICULO.FirstOrDefault(linha => linha.PLACA.Equals(txtPlaca.Text));

                    if (vei != null)
                    {
                        lblValidacao.Text = "Placa ja Cadastrada!";
                        return;
                    }

                    vei = conexao.VEICULO.FirstOrDefault(linha => linha.PREFIXO.Equals(txtPrefixo.Text));

                    if (vei != null)
                    {
                        lblValidacao.Text = "Prefixo ja Cadastrado!";
                        return;
                    }

                    if (double.TryParse(txtKm.Text, out km) == false)
                    {
                        lblValidacao.Text = "Valor Incorreto, Porfavor informe uma quilometragem valida!";
                        return;
                    }

                    VEICULO veiculo = new VEICULO();

                    veiculo.PLACA = txtPlaca.Text.ToUpper();
                    veiculo.PREFIXO = txtPrefixo.Text.ToUpper();
                    veiculo.KM_COMPRA = km;
                    veiculo.KM_ATUAL = km;

                    conexao.VEICULO.Add(veiculo);
                    conexao.SaveChanges();

                    carregarGrid();
                    carregarPrefixo();
                }
            }


        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                try
                {
                    if (gridVeiculo.SelectedValue != null)
                    {
                        VEICULO v = conexao.VEICULO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(gridVeiculo.SelectedValue.ToString()));

                        conexao.VEICULO.Remove(v);

                        gridVeiculo.SelectedIndex = -1;

                    }

                    conexao.SaveChanges();

                    carregarGrid();
                }
                catch (Exception)
                {
                    lblValidacao.Text = "Não foi possivel efetuar a Exclusão";
                }
            }
        }

        protected void gridVeiculo_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                int idSelecionado = Convert.ToInt32(gridVeiculo.SelectedValue);

                VEICULO veiculo = conexao.VEICULO.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(idSelecionado.ToString()));


                txtPlacaVeiculo.Text = veiculo.PLACA;
                txtPrefixoVeiculo.Text = veiculo.PREFIXO;
                txtKmVeiculo.Text = veiculo.KM_COMPRA.ToString();
            }
        }

        protected void btnEditarVeiculo_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    if (gridVeiculo.SelectedValue != null)
                    {
                        VEICULO veiculo = conexao.VEICULO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(gridVeiculo.SelectedValue.ToString()));

                        if (string.IsNullOrEmpty(txtPlacaVeiculo.Text) ||
                        (string.IsNullOrEmpty(txtPrefixoVeiculo.Text)) ||
                        (string.IsNullOrEmpty(txtKmVeiculo.Text)))
                        {
                            lblValidacao.Text = "Favor Preencher todos os Campos solicitados";
                            return;
                        }
                        else
                        {
                            veiculo.PLACA = txtPlacaVeiculo.Text.ToUpper();
                            veiculo.PREFIXO = txtPrefixoVeiculo.Text;
                            veiculo.KM_COMPRA = Convert.ToDouble(txtKmVeiculo.Text);
                            veiculo.KM_ATUAL = Convert.ToDouble(txtKmVeiculo.Text);

                            conexao.Entry(veiculo);

                            gridVeiculo.SelectedIndex = -1;
                        }
                    }

                    conexao.SaveChanges();

                    carregarGrid();
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao salvar o veiuclo";
            }
            
        }

        protected void btnExcluirManutencao_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (gridManutencao.SelectedValue != null)
                {
                    MANUTENCAO m = conexao.MANUTENCAO.FirstOrDefault(
                        linha => linha.ID.ToString().Equals(gridManutencao.SelectedValue.ToString()));

                    conexao.MANUTENCAO.Remove(m);
                }

                gridManutencao.SelectedIndex = -1;

                conexao.SaveChanges();

                carregarGridManutencao();
            }
        }

        protected void btnSalvarManutencao_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    double km = 0, kmProx = 0, litros=0;

                    MANUTENCAO m = new MANUTENCAO();
                    VEICULO v = conexao.VEICULO.FirstOrDefault(
                        linha => linha.ID.ToString().Equals(ddlPrefixo.SelectedValue.ToString()));

                    if (double.TryParse(txtKmManutencao.Text, out km) == false)
                    {
                        lblValidacaoManutencao.Text = "Quilometragem Invalida";
                        return;
                    }
                    if (double.TryParse(txtkmProximaManutencao.Text, out kmProx) == false)
                    {
                        txtkmProximaManutencao.Focus();
                        lblValidacaoManutencao.Text = "Quilometragem Invalida";
                        return;
                    }
                    if (double.TryParse(txtQtdOleoMotor.Text, out litros)==false)
                    {
                        lblValidacaoManutencao.Text = "Quantidade de litros Invalida!";
                    }

                    if (
                        string.IsNullOrEmpty(txtFiltroAr.Text) &&
                        string.IsNullOrEmpty(txtFiltroCombustivel.Text) &&
                        string.IsNullOrEmpty(txtFiltroRacor.Text) &&
                        string.IsNullOrEmpty(txtFiltroOleoMotor.Text))
                    {
                        lblValidacaoManutencao.Text = "Favor Preencher todos os Campos solicitados";
                        return;
                    }
                    else
                    {
                        v.KM_ATUAL = km;
                        m.KM_ATUAL = km;
                        m.KM_PROXIMA_TROCA = kmProx;
                        m.FILTRO_AR = txtFiltroAr.Text;
                        m.FILTRO_COMBUSTIVEL = txtFiltroCombustivel.Text;
                        m.FILTRO_RACOR = txtFiltroRacor.Text;
                        m.FILTRO_OLEO_MOTOR = txtFiltroOleoMotor.Text;
                        m.QUANTIDADE_OLEO_MOTOR = litros;
                        m.FK_VEICULO = Convert.ToInt32(ddlPrefixo.SelectedValue);

                        conexao.MANUTENCAO.Add(m);
                        conexao.Entry(v);
                        conexao.SaveChanges();

                        carregarGridManutencao();
                        carregarGrid();
                    }
                }
            }
            catch (Exception)
            {
                lblValidacaoManutencao.Text = "Erro ao Salvar os dados";
            }
            

        }

        protected void btnEditarManutencao_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    if (gridManutencao.SelectedValue != null)
                    {
                        double km = 0, kmProx = 0, litros=0;

                        MANUTENCAO m = new MANUTENCAO();
                        VEICULO v = conexao.VEICULO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(ddlPrefixo.SelectedValue.ToString()));

                        if (double.TryParse(txtKmManutencaoE.Text, out km) == false)
                        {
                            lblValidacaoManutencao.Text = "Quilometragem Invalida";
                            return;
                        }
                        if (double.TryParse(txtKmProximaManutencaoE.Text, out kmProx) == false)
                        {
                            txtkmProximaManutencao.Focus();
                            lblValidacaoManutencao.Text = "Quilometragem Invalida";
                            return;
                        }
                        if (double.TryParse(txtQtdOleoMotorE.Text, out litros) == false)
                        {
                            lblValidacaoManutencao.Text = "Quantidade de litros Invalida!";
                        }

                        if (string.IsNullOrEmpty(txtFltroArE.Text) &&
                            string.IsNullOrEmpty(txtFiltroCombustivelE.Text) &&
                            string.IsNullOrEmpty(txtFiltroRacorE.Text) &&
                            string.IsNullOrEmpty(txtFiltroOleoMotorE.Text))
                        {
                            lblValidacaoManutencao.Text = "Favor Preencher todos os Campos solicitados";
                            return;
                        }
                        else
                        {
                            v.KM_ATUAL = km;
                            m.KM_ATUAL = km;
                            m.KM_PROXIMA_TROCA = kmProx;
                            m.FILTRO_AR = txtFltroArE.Text;
                            m.FILTRO_COMBUSTIVEL = txtFiltroCombustivelE.Text;
                            m.FILTRO_RACOR = txtFiltroRacorE.Text;
                            m.FILTRO_OLEO_MOTOR = txtFiltroOleoMotorE.Text;
                            m.QUANTIDADE_OLEO_MOTOR = litros;
                            m.FK_VEICULO = Convert.ToInt32(ddlPrefixo.SelectedValue);

                            conexao.Entry(m);
                            conexao.Entry(v);
                            conexao.SaveChanges();

                            carregarGridManutencao();
                            carregarGrid();

                            gridManutencao.SelectedIndex = -1;
                            gridVeiculo.SelectedIndex = -1;
                        }
                    }
                }
            }
            catch (Exception)
            {
                lblValidacaoManutencao.Text = "Erro ao Salvar os Dados!";
            }
            
        }

        protected void gridManutencao_SelectedIndexChanged1(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                int idSelecionado = Convert.ToInt32(gridManutencao.SelectedValue);

                MANUTENCAO m = conexao.MANUTENCAO.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(idSelecionado.ToString()));

                txtKmManutencaoE.Text = m.KM_ATUAL.ToString();
                txtKmProximaManutencaoE.Text = m.KM_PROXIMA_TROCA.ToString();
                txtFltroArE.Text = m.FILTRO_AR.ToString();
                txtFiltroCombustivelE.Text = m.FILTRO_COMBUSTIVEL.ToString();
                txtFiltroRacorE.Text = m.FILTRO_RACOR.ToString();
                txtFiltroOleoMotorE.Text = m.FILTRO_OLEO_MOTOR.ToString();
                txtQtdOleoMotorE.Text = m.QUANTIDADE_OLEO_MOTOR.ToString();
                ddlPrefixoE.SelectedValue = m.FK_VEICULO.ToString();
            }
        }
    }
}