using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class fornecedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CArregarFornecedor(con);
                }
            }

        }

        private void CArregarFornecedor(VIACAOARAUJOEntities con)
        {
            List<FORNECEDOR> lista = con.FORNECEDOR.ToList();

            gridFornecedor.DataSource = lista;
            gridFornecedor.DataBind();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    if (string.IsNullOrWhiteSpace(txtNomeEditar.Text) &&
                        string.IsNullOrWhiteSpace(txtCnpjEditar.Text) &&
                        string.IsNullOrWhiteSpace(txtCidadeEditar.Text) &&
                        string.IsNullOrWhiteSpace(txtEstadoEditar.Text) &&
                        string.IsNullOrWhiteSpace(txtContatoEditar.Text))
                    {
                        lblValidacao.Text = "Por favor Preencher todos os campos !";
                        return;
                    }


                    FORNECEDOR f = con.FORNECEDOR.FirstOrDefault(linha => linha.ID.ToString().Equals(gridFornecedor.SelectedValue.ToString()));

                    f.NOME = txtNomeEditar.Text.ToUpper();
                    f.CNPJ = txtCnpjEditar.Text.Replace(".", "").Replace("/", "").Replace("-", "");
                    f.CIDADE = txtCidadeEditar.Text.ToUpper();
                    f.ESTADO = txtEstadoEditar.Text.ToUpper();
                    f.CONTATO = txtContatoEditar.Text.ToUpper();

                    con.Entry(f);
                    con.SaveChanges();

                    CArregarFornecedor(con);
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao Salvar o registro!";
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    if (string.IsNullOrWhiteSpace(txtNomeFornecedor.Text) &&
                        string.IsNullOrWhiteSpace(txtCnpjFornecedor.Text) &&
                        string.IsNullOrWhiteSpace(txtCidade.Text) &&
                        string.IsNullOrWhiteSpace(txtUfFornecedor.Text) &&
                        string.IsNullOrWhiteSpace(txtContatoFornecedor.Text))
                    {
                        lblValidacao.Text = "Por favor Preencher todos os campos !";
                        return;
                    }


                    FORNECEDOR f = new FORNECEDOR();

                    f.NOME = txtNomeFornecedor.Text.ToUpper();
                    f.CNPJ = txtCnpjFornecedor.Text.Replace(".","").Replace("/","").Replace("-","");
                    f.CIDADE = txtCidade.Text.ToUpper();
                    f.ESTADO = txtUfFornecedor.Text.ToUpper();
                    f.CONTATO = txtContatoFornecedor.Text.ToUpper();

                    con.FORNECEDOR.Add(f);
                    con.SaveChanges();

                    CArregarFornecedor(con);
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao Salvar o registro!";
            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    if (gridFornecedor.SelectedValue != null)
                    {
                        FORNECEDOR f = con.FORNECEDOR.FirstOrDefault(linha => linha.ID.ToString().Equals(gridFornecedor.SelectedValue.ToString()));

                        con.FORNECEDOR.Remove(f);
                        con.SaveChanges();

                        gridFornecedor.SelectedIndex = -1;

                        CArregarFornecedor(con);

                        lblValidacao.Text = string.Empty;
                    }
                    else
                    {
                        lblValidacao.Text = "Selecione um Registro";
                    }

                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Não foi possivel Excluir o registro.";
            }
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (ddlBusca.Text.Equals("CNPJ"))
                {
                    List<FORNECEDOR> lista = conexao.FORNECEDOR.Where(
                        linha => linha.CNPJ.Contains(txtBusca.Text.Replace(".", "").Replace("/", "").Replace("-", ""))).ToList();

                    gridFornecedor.DataSource = lista.OrderBy(x => x.NOME);
                    gridFornecedor.DataBind();
                }
                else if (ddlBusca.Text.Equals("NOME"))
                {
                    List<FORNECEDOR> lista = conexao.FORNECEDOR.Where(linha => linha.NOME.Contains(txtBusca.Text)).ToList();

                    gridFornecedor.DataSource = lista.OrderBy(x => x.NOME);
                    gridFornecedor.DataBind();
                }
            }
        }
    }
}