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
        VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities();

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
            var lista = conexao.MANUTENCAO.ToList();
            gridManutencao.DataSource = lista;
            gridManutencao.DataBind();

        }

        private void carregarGrid()
        {
            var lista = conexao.VEICULO.ToList();
            gridVeiculo.DataSource = lista;
            gridVeiculo.DataBind();
        }

        private void carregarPrefixo()
        {
            var lista = conexao.VEICULO.ToList();
            ddlPrefixo.DataSource = lista;
            ddlPrefixo.DataValueField = "ID";
            ddlPrefixo.DataTextField = "PREFIXO";
            ddlPrefixo.DataBind();

        }

        protected void btnSalvarVeiculo_Click(object sender, EventArgs e)
        {
            VEICULO veiculo = new VEICULO();

            veiculo.PLACA = txtPlaca.Text.ToUpper();
            veiculo.PREFIXO = txtPrefixo.Text;
            veiculo.KM_COMPRA = Convert.ToDouble(txtKm.Text);
            veiculo.KM_ATUAL = Convert.ToDouble(txtKm.Text);

            conexao.VEICULO.Add(veiculo);
            conexao.SaveChanges();

            carregarGrid();

        }

        protected void btnExcluir_Click(object sender, EventArgs e)
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

        protected void gridVeiculo_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSelecionado = Convert.ToInt32(gridVeiculo.SelectedValue);

            VEICULO veiculo = conexao.VEICULO.FirstOrDefault(
                linha => linha.ID.ToString().Equals(gridVeiculo.SelectedValue.ToString()));

            txtPlacaVeiculo.Text = veiculo.PLACA;
            txtPrefixoVeiculo.Text = veiculo.PREFIXO;
            txtKmVeiculo.Text = veiculo.KM_COMPRA.ToString();

        }

        protected void btnEditarVeiculo_Click(object sender, EventArgs e)
        {
            if (gridVeiculo.SelectedValue != null)
            {
                VEICULO veiculo = conexao.VEICULO.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(gridVeiculo.SelectedValue.ToString()));

                veiculo.PLACA = txtPlacaVeiculo.Text.ToUpper();
                veiculo.PREFIXO = txtPrefixoVeiculo.Text;
                veiculo.KM_COMPRA = Convert.ToDouble(txtKmVeiculo.Text);
                veiculo.KM_ATUAL = Convert.ToDouble(txtKmVeiculo.Text);

                conexao.Entry(veiculo);

                gridVeiculo.SelectedIndex = -1;
            }

            conexao.SaveChanges();

            carregarGrid();
        }

        protected void btnExcluirManutencao_Click(object sender, EventArgs e)
        {

        }

        protected void btnSalvarManutencao_Click(object sender, EventArgs e)
        {
            MANUTENCAO m = new MANUTENCAO();
            VEICULO v = conexao.VEICULO.FirstOrDefault(linha => linha.ID.ToString().Equals(ddlPrefixo.SelectedValue.ToString()));

            v.KM_ATUAL = Convert.ToDouble(txtKmManutencao.Text);
            m.KM_ATUAL = Convert.ToDouble(txtKmManutencao.Text);
            m.KM_PROXIMA_TROCA = Convert.ToDouble(txtkmProximaManutencao.Text);
            m.FILTRO_AR=txtFiltroAr.Text;
            m.FILTRO_COMBUSTIVEL = txtFiltroCombustivel.Text;
            m.FILTRO_RACOR = txtFiltroRacor.Text;
            m.FILTRO_OLEO_MOTOR = txtFiltroOleoMotor.Text;
            m.QUANTIDADE_OLEO_MOTOR =Convert.ToDouble(txtQtdOleoMotor.Text);
            m.FK_VEICULO = Convert.ToInt32(ddlPrefixo.SelectedValue);

            conexao.MANUTENCAO.Add(m);
            conexao.Entry(v);
            conexao.SaveChanges();

            carregarGridManutencao();
            carregarGrid();



        }
    }
}