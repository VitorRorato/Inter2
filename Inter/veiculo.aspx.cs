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
            try
            {
                if (!IsPostBack)
                {
                    carregarGrid();
                }
            }
            catch (Exception)
            {

            }

        }



        private void carregarGrid()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                var lista = conexao.VEICULO.ToList().OrderBy(x => x.PREFIXO);
                gridVeiculo.DataSource = lista;
                gridVeiculo.DataBind();
            }
        }



        protected void btnSalvarVeiculo_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    double km = 0;

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

                        if (km < 0)
                        {
                            lblValidacao.Text = "Valor Negativo!";
                            return;
                        }

                        VEICULO veiculo = new VEICULO();

                        veiculo.PLACA = txtPlaca.Text.ToUpper();
                        veiculo.PREFIXO = txtPrefixo.Text.ToUpper();
                        veiculo.KM_COMPRA = km;
                        veiculo.KM_ATUAL = km;

                        conexao.VEICULO.Add(veiculo);
                        conexao.SaveChanges();
                    }

                    carregarGrid();
                    limpar();
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao salvar veiculo!";
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

                    limpar();
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao salvar o Veiculo PorFavor Verifique os Dados Informados!";
            }

        }

        private void limpar()
        {
            txtPrefixo.Text = string.Empty;
            txtPlaca.Text = string.Empty;
            txtKm.Text = string.Empty;

            txtPrefixoVeiculo.Text = string.Empty;
            txtPlacaVeiculo.Text = string.Empty;
            txtKmVeiculo.Text = string.Empty;

            lblValidacao.Text = string.Empty;
        }
    }

}